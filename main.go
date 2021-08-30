package main

import (
	"farmcrowdy/auth"
	"farmcrowdy/campaign"
	"farmcrowdy/handler"
	"farmcrowdy/helper"
	"farmcrowdy/payment"
	"farmcrowdy/transaction"
	"farmcrowdy/user"
	"log"
	"net/http"
	"path/filepath"
	"strings"

	webHandler "farmcrowdy/web/handler"

	"github.com/dgrijalva/jwt-go"
	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/multitemplate"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func main() {
	dsn := "root:@tcp(127.0.0.1:3306)/farmcrowdy?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal(err.Error())
	}

	userRepository := user.NewRepository(db)
	campaignRepository := campaign.NewRepository(db)
	transactionRepository := transaction.NewRepository(db)

	userService := user.NewService(userRepository)
	campaignService := campaign.NewService(campaignRepository)
	authService := auth.NewService()
	paymentService := payment.NewService()
	transactionService := transaction.NewService(transactionRepository, campaignRepository, paymentService)

	userHandler := handler.NewUserHandler(userService, authService)
	campaignHandler := handler.NewCampaignHandler(campaignService)
	transactionHandler := handler.NewTransactionHandler(transactionService)

	userWebHandler := webHandler.NewUserHandler(userService)
	campaignWebHanlder := webHandler.NewCampaignHandler(campaignService, userService)
	transactionWebHandler := webHandler.NewTransactionHandler(transactionService)
	sessionWebHandler := webHandler.NewSessionHandler(userService)

	router := gin.Default()
	/* CORS */

	router.Use(cors.New(cors.Config{
		AllowOrigins: []string{"http://localhost:3000"},
		AllowMethods: []string{"GET", "PUT", "PATCH", "POST", "DELETE"},
		AllowHeaders: []string{"Authorization", "Content-Type"},
	}))

	// cookieStore := cookie.NewStore([]byte(auth.SECRET_KEY))
	// router.Use(sessions.Sessions("farmcrowdy", cookieStore))

	router.HTMLRender = loadTemplates("./web/templates")

	router.Static("/images", "./images")
	router.Static("/css", "./web/assets/css")
	router.Static("/js", "./web/assets/js")
	router.Static("/img", "./web/assets/img")
	router.Static("/webfonts", "./web/assets/webfonts")

	api := router.Group("/api/v1")

	api.POST("/users", userHandler.RegisterUser)
	api.POST("/sessions", userHandler.Login)
	api.POST("/email_checkers", userHandler.CheckEmailAvailability)
	api.POST("/avatars", authMiddleware(authService, userService), userHandler.UploadAvatar)
	api.GET("/users/fetch", authMiddleware(authService, userService), userHandler.FetchUser)

	api.GET("/projek", campaignHandler.GetCampaigns)
	api.GET("/projek/:id", campaignHandler.GetCampaign)
	api.POST("/projek", authMiddleware(authService, userService), campaignHandler.CreateCampaign)
	api.PUT("/projek/:id", authMiddleware(authService, userService), campaignHandler.UpdateCampaign)
	api.POST("/projek-images", authMiddleware(authService, userService), campaignHandler.UploadImage)

	api.GET("/projek/:id/transaksi", authMiddleware(authService, userService), transactionHandler.GetCampaignTransactions)
	api.GET("/transaksi", authMiddleware(authService, userService), transactionHandler.GetUserTransactions)
	api.POST("/transaksi", authMiddleware(authService, userService), transactionHandler.CreateTransaction)
	api.POST("/transaksi/notification", transactionHandler.GetNotification)

	router.GET("/users", userWebHandler.Index)
	router.GET("/users/new", userWebHandler.New)
	router.POST("/users", userWebHandler.Create)
	router.GET("/users/edit/:id", userWebHandler.Edit)
	router.POST("/users/update/:id", userWebHandler.Update)
	router.GET("/users/avatar/:id", userWebHandler.NewAvatar)
	router.POST("/users/avatar/:id", userWebHandler.CreateAvatar)

	router.GET("/projek", campaignWebHanlder.Index)
	router.GET("/projek/new", campaignWebHanlder.New)
	router.POST("/projek", campaignWebHanlder.Create)
	router.GET("/projek/image/:id", campaignWebHanlder.NewImage)
	router.POST("/projek/image/:id", campaignWebHanlder.CreateImage)
	router.GET("/projek/edit/:id", campaignWebHanlder.Edit)
	router.POST("/projek/update/:id", campaignWebHanlder.Update)
	router.GET("/projek/show/:id", campaignWebHanlder.Show)
	router.GET("/transaksi", transactionWebHandler.Index)

	// router.GET("/login", sessionWebHandler.New)
	router.POST("/session", sessionWebHandler.Create)
	// router.GET("/logout", sessionWebHandler.Destroy)

	router.Run()
}

func authMiddleware(authService auth.Service, userService user.Service) gin.HandlerFunc {
	return func(c *gin.Context) {
		authHeader := c.GetHeader("Authorization")

		if !strings.Contains(authHeader, "Bearer") {
			response := helper.APIResponse("Unauthorized", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		tokenString := ""
		arrayToken := strings.Split(authHeader, " ")
		if len(arrayToken) == 2 {
			tokenString = arrayToken[1]
		}

		token, err := authService.ValidateToken(tokenString)
		if err != nil {
			response := helper.APIResponse("Unauthorized", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		claim, ok := token.Claims.(jwt.MapClaims)

		if !ok || !token.Valid {
			response := helper.APIResponse("Unauthorized", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		userID := int(claim["user_id"].(float64))

		user, err := userService.GetUserByID(userID)
		if err != nil {
			response := helper.APIResponse("Unauthorized", http.StatusUnauthorized, "error", nil)
			c.AbortWithStatusJSON(http.StatusUnauthorized, response)
			return
		}

		c.Set("currentUser", user)
	}
}

// func authAdminMiddleware() gin.HandlerFunc {
// 	return func(c *gin.Context) {
// 		session := sessions.Default(c)

// 		userIDSession := session.Get("userID")

// 		if userIDSession == nil {
// 			c.Redirect(http.StatusFound, "/login")
// 			return
// 		}
// 	}
// }

func loadTemplates(templatesDir string) multitemplate.Renderer {
	r := multitemplate.NewRenderer()

	layouts, err := filepath.Glob(templatesDir + "/layouts/*")
	if err != nil {
		panic(err.Error())
	}

	includes, err := filepath.Glob(templatesDir + "/**/*")
	if err != nil {
		panic(err.Error())
	}

	for _, include := range includes {
		layoutCopy := make([]string, len(layouts))
		copy(layoutCopy, layouts)
		files := append(layoutCopy, include)
		r.AddFromFiles(filepath.Base(include), files...)
	}
	return r
}
