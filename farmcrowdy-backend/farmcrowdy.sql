-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2021 at 04:41 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmcrowdy`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `description_komoditas` text NOT NULL,
  `description_prospek` text DEFAULT NULL,
  `description_risiko` text DEFAULT NULL,
  `description_kelompok_tani` text DEFAULT NULL,
  `goal_amount` int(15) NOT NULL,
  `current_amount` int(15) NOT NULL,
  `perks` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `backer_count` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `short_description`, `description_komoditas`, `description_prospek`, `description_risiko`, `description_kelompok_tani`, `goal_amount`, `current_amount`, `perks`, `slug`, `backer_count`, `created_at`, `updated_at`) VALUES
(1, 32, 'Bantu Pertanian Porang Organik Desa Cipayung', 'Komoditas masa depan pengganti nasi', 'Vanili merupakan tanaman yang buahnya bernilai ekonomi tinggi dan dapat digunakan sebagai bahan campuran makanan dan minuman. Vanili banyak digunakan sebagai bahan pembantu industri makanan dan pewangi obat-obatan, (flavour and fragrance ingredients). Sehingga, kebutuhannya cukup tinggi di pasaran.', 'Vanili merupakan salah satu komoditas ekspor rempah yang penting bagi peningkatan devisa negara. Permintaannya yang tinggi dan harga jual yang sangat tinggi di pasar lokal maupun internasional, juga salah satu faktor yang membuat vanili  menjadi menarik untuk dibudidayakan.', 'Dalam budidaya vanili, kondisi lingkungan sangat menentukan sehingga dibutuhkan perlakuan yang khusus serta tepat agar resiko dapat ditekan. Daerah yang sesuai untuk budidaya vanili harus berada pada ketinggian 1-700 mdpl, bulan kering 2-4 bulan, temperatur 23-26 C, dan kelembaban 50-75%. Hama utama Vanili adalah bekicot dan ulat. Sedangkan untuk penyakit seringkali dijumpai Fusarium sp. dan Trichoderma sp. Baik untuk hama dan penyakit, pencegahan dan penanggulangan dini selalu dilakukan secara berkala.', 'Kelompok Tani JVM adalah kelompok tani yang sudah berdiri sejak tahun 2015. Kelompok tani ini memiliki lahan dengan luas total 2 hektar berlokasi di Jawa Tengah. Selama ini, mereka melakukan pembudidayaan vanili dengan modal sendiri. Namun sekarang bersama TaniFund, mereka berharap usaha pembudidayaan vanili mereka bisa berkembang dan dapat meningkatkan kesejahteraan masyarakat setempat dengan menyediakan peluang pekerjaan. Didasari dengan pertimbangan rekam jejak yang baik serta pengalaman budidaya kelompok tani ini, maka TaniFund tertarik untuk menjalin kerjasama dengan mereka.', 70000000, 70000000, 'Dapat goodiebag cantik,Dapat keuntungan 10%,menjadi bagian dari perubahan', 'campaign-satu', '6', '2021-07-31 07:47:30.000000', '2021-08-20 19:37:29.698471'),
(44, 32, 'Budidaya Aneka Sayuran Bogor - 3', 'Sayuran merupakan sumber vitamin dan mineral terutama karoten, Vit A, Vit C, zat besi dan fosfor', 'Sayuran merupakan sumber vitamin dan mineral terutama karoten, Vit A, Vit C, zat besi dan fosfor. Sebagian vitamin, mineral yang terkandung dalam sayuran berperan sebagai antioksidan. Beberapa sayuran dapat dikonsumsi mentah tanpa dimasak terlebih dahulu sementara yang lainnya dapat dimasak dengan cara dikukus, direbus dan ditumis.a', 'Sayuran merupakan komoditas hortikultura, selain memiliki nilai ekonomi yang cukup besar, ternyata juga memiliki potensi yang tinggi dalam pemenuhan gizi di dalam tubuh. Tanaman sayur yang mengandung berbagai zat gizi ini tidak hanya dapat digunakan sebagai konsumsi pangan sehari-hari, tetapi juga bagi pengobatan tradisional (herbal healing) dengan bahan-bahan alami. Seiring meningkatnya kesejahteraan, masyarakat semakin peduli terhadap faktor kesehatan, yakni dengan mengkonsumsi makanan sehat dan bermutu maka permintaan sayuran pun menjadi lebih tinggi sehingga pasarnya luas.b', 'Cuaca ekstrim yang sering berubah – ubah seperti sering turun hujan yang sangat lebat akan menyebabkan daerah penanaman terserang banjir, selain itu jika terjadi cuaca yang sangat panas maka akan menyebabkan kekeringan yang sangat parah.c', 'Kelompok Tani DH merupakan kelompok tani yang berada di daerah Jawa Barat. Kelompok tani ini sudah berdiri sejak tahun 2016 dengan 5 orang anggota kelompok. Kelompok tani ini sudah berpengalaman dalam melakukan budidaya aneka sayuran selama 5 tahun. Berdasarkan pengalaman kelompok tani ini maka TaniFund tertarik untuk melakukan kerja sama.d', 897000000, 597000000, 'Saham 10% dari hasil panen,menjadi mitra', 'budidaya-aneka-sayuran-bogor-2-32', '3', '2021-08-20 20:19:53.269928', '2021-08-21 21:09:20.786875'),
(45, 52, 'Budidaya Ikan Nila Subang - 3 ', 'Ikan air tawar yang banyak dikonsumsi masyarakat Indonesia.', 'Ikan nila dengan nama Latin Oreochromis niloticus merupakan ikan air tawar yang banyak dikonsumsi masyarakat Indonesia. Ikan nila mempunyai tubuh memanjang dan ramping, sisik ikan nila relatif besar, matanya menonjol dan besar dengan tepi berwarna putih. Ikan nila mempunyai lima buah sirip yang berada di punggung, dada, perut, anus, dan ekor. Ikan nila toleran terhadap perbedaan lingkungan sangat tinggi, dapat hidup pada salinitas 0-29 permil; suhu 14-38 °C; pH 5 — 11.', 'Ikan nila dikenal dengan pertumbuhannya yang sangat cepat, yakni hanya membutuhkan waktu 4 hingga 6 bulan untuk pembesarannya hingga memenuhi ukuran standar untuk dikonsumsi. Ikan nila dianggap cukup kuat terhadap gangguan penyakit yang biasa dialami oleh jenis ikan lainnya, sehingga perawatannya mudah dan biayanya murah, namun hasilnya relatif menguntungkan.', 'Bobot ikan yang tidak ideal dikarenakan ada kemungkinan pakan yang diberikan tidak mengandung protein yang cukup. Maka dari itu Dalam pemberian pakan, harus diperhitungkan juga sample saat menentukan berat badan ikan, yaitu sebagai patokan ketika pakan diberikan. ', 'MN 37 adalah pelaku budidaya yang memiliki expertise dan pengetahuan mendalam di bidang perikanan yang berlokasi di wilayah Subang, Jawa Barat. Kelompok ternak yang diketuai oleh Bapak Jaja Subagja beranggotakan 4 orang. Berdiri sejak 3 tahun yang lalu kelompok ternak ini memiliki lahan sekiar 1 Ha. Didukung oleh kinerja dan pengalaman budidaya para peternak yang baik mendasari Tanifund untuk bisa membantu memberikan pendanaan kepada kelompok ternak tersebut.', 412400000, 412400000, 'saham penghasilan 10%, menjadi mitra tambang ikan kami', 'budidaya-ikan-nila-subang-3-52', '2', '2021-08-21 14:28:26.392247', '2021-08-21 14:28:26.392247'),
(46, 52, 'Budidaya Jamur Tiram Kuningan 1', 'Jamur tiram merupakan bahan makanan bernutrisi yang kaya akan vitamin dan mineral, rendah karbohidrat, lemak, dan protein.', 'Jamur tiram atau dengan nama latin Pleurotus ostreatus merupakan salah satu kelompok jamur yang sudah banyak dikenal karena bentuk dan ukuran tubuh buahnya yang sangat familiar di masyarakat. Ciri-ciri umum tubuh buah berwarna putih hingga krem dan tudungnya berbentuk setengah lingkaran mirip cangkang yang bagian tengahnya agak cekung. Jamur tiram sering dikenal dengan sebutan King Oyster Mushroom dan merupakan salah satu jenis jamur yang dapat dimakan (edible) serta memiliki rasa yang cukup khas. Jamur tiram tumbuh optimal pada kayu lapuk yang tersebar di dataran rendah sampai lereng pegunungan atau kawasan yang memiliki ketinggian antara 600 m-800 m diatas permukaan laut. Miselium dan tubuh buahnya tumbuh dan berkembang baik pada suhu yang lembab berkisar pada 26-30 °C.', 'Jamur tiram (Pleurotus ostreatus) merupakan bahan makanan bernutrisi yang kaya akan vitamin dan mineral, rendah karbohidrat, lemak, dan protein. Jamur tiram juga memiliki berbagai manfaat yaitu sebagai makanan, menurunkan kolesterol, sebagai anti bakterial dan anti tumor. Dilihat dari kandungan gizi yang terdapat dalam jamur tiram maka bahan ini termasuk aman untuk dikonsumsi.', 'Serangan serangga atau lalat terhadap jamur sangat besar. Permasalahan hama penyakit dapat teratasi dengan menjaga kebersihan tempat, penggunaan pestisida atau feromon (cairan hormon perangkap hama). Selain itu, tempat tumbuh jamur selalu terjaga kelembabannya. Pasalnya, untuk menunjang tumbuhnya badan jamur, dibutuhkan kelembaban yang tinggi.', 'Kelompok Tani AM merupakan kelompok tani yang berada di daerah Jawa Barat. Kelompok tani ini sudah berdiri sejak tahun 2017 dengan 5 orang anggota kelompok. Kelompok tani yang sudah berpengalaman dalam melakukan budidaya jamur tiram ini melakukan budidaya di atas lahan seluas 0.2 Ha. Berdasarkan pengalaman kelompok tani ini maka TaniFund tertarik untuk melakukan kerja sama.', 420700000, 0, 'Hasil panen 20%,Pemilik saham 10%', 'budidaya-jamur-tiram-kuningan-1-52', '0', '2021-08-21 20:00:16.478650', '2021-08-21 20:45:02.647898'),
(47, 32, 'Budidaya Pembesaran Ikan Mas dan Ikan Nila Bandung Barat 1', 'kan mas merupakan ikan air tawar yang mempunyai nilai ekonomis. ', '', '', '', '', 174800000, 0, 'Hasil Keuntungan 10%, Min Kontribusi Rp 100k', 'budidaya-pembesaran-ikan-mas-dan-ikan-nila-bandung-barat-1-32', '0', '2021-08-21 20:15:45.878134', '2021-08-21 21:39:01.019697');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_images`
--

CREATE TABLE `campaign_images` (
  `id` int(10) NOT NULL,
  `campaign_id` int(10) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `is_primary` tinyint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `campaign_images`
--

INSERT INTO `campaign_images` (`id`, `campaign_id`, `file_name`, `is_primary`, `created_at`, `updated_at`) VALUES
(60, 1, 'images/32-qamma-farm-L6T_mq0bwwA-unsplash.jpg', 0, '2021-08-18 17:54:01.900259', '2021-08-19 14:18:27.457156'),
(61, 2, 'images/2-qamma-farm-L6T_mq0bwwA-unsplash.jpg', 1, '2021-08-18 18:01:54.544922', '2021-08-18 18:01:54.544922'),
(62, 31, 'images/2-qamma-farm-L6T_mq0bwwA-unsplash.jpg', 1, '2021-08-18 18:02:05.299328', '2021-08-18 18:02:05.299328'),
(63, 35, 'images/1-qamma-farm-UfGEUNbnh_8-unsplash.jpg', 1, '2021-08-18 18:02:15.855369', '2021-08-18 18:02:15.855369'),
(64, 36, 'images/32-qamma-farm-DFSc_C9Recw-unsplash.jpg', 1, '2021-08-18 18:02:25.504446', '2021-08-18 18:02:25.504446'),
(65, 37, 'images/32-qamma-farm-UfGEUNbnh_8-unsplash.jpg', 1, '2021-08-18 18:02:36.035929', '2021-08-18 18:02:36.035929'),
(66, 1, 'images/32-qamma-farm-DFSc_C9Recw-unsplash.jpg', 1, '2021-08-19 14:18:27.605083', '2021-08-19 14:18:27.605083'),
(67, 44, 'images/32-gambap buah sayur.webp', 1, '2021-08-20 20:21:07.356357', '2021-08-20 20:21:07.356357'),
(68, 45, 'images/52-ikan.webp', 1, '2021-08-21 14:29:39.541996', '2021-08-21 14:29:39.541996'),
(69, 46, 'images/52-jamur.jpg', 1, '2021-08-21 20:02:14.611548', '2021-08-21 20:02:14.611548'),
(70, 47, 'images/32-ikan-mas.webp', 1, '2021-08-21 20:17:59.655128', '2021-08-21 20:17:59.655128');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) NOT NULL,
  `campaign_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `amount` int(20) NOT NULL,
  `status` varchar(15) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `payment_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `campaign_id`, `user_id`, `amount`, `status`, `code`, `payment_url`, `created_at`, `updated_at`) VALUES
(46, 44, 1, 500000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/d8819a83-c7c0-446c-a0df-9cf05d8325a9', '2021-08-20 14:12:30', '2021-08-20 21:12:31.545164'),
(47, 45, 32, 100000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/9ecf8585-7ee7-450a-9e38-8e913d1c979e', '2021-08-21 07:32:38', '2021-08-21 14:32:40.386240'),
(48, 45, 32, 50000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/ab028360-562a-4c14-855a-fd81dee64def', '2021-08-21 07:51:06', '2021-08-21 14:51:06.693379'),
(49, 45, 32, 80000000, 'paid', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/30381ac6-5124-49bd-8ed8-2f2510a3d295', '2021-08-21 07:55:44', '2021-08-21 14:55:44.974597'),
(50, 45, 1, 332400000, 'paid', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/6a7632b0-7b36-4fd7-a4b1-e38e7e005c2c', '2021-08-21 07:59:40', '2021-08-21 14:59:41.405145'),
(51, 44, 52, 50000000, 'paid', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/3e7d9097-70a8-4cd7-a8f8-19d036903177', '2021-08-21 08:35:29', '2021-08-21 15:35:30.182670'),
(52, 44, 1, 47000000, 'paid', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/23c70322-b27f-4322-bb3a-426fb4fe7fbd', '2021-08-21 08:42:10', '2021-08-21 15:42:10.488162'),
(53, 1, 52, 20000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/d6920d2b-0b13-4bcf-90a6-bb3820604571', '2021-08-21 08:44:08', '2021-08-21 15:44:08.848304'),
(54, 1, 52, 20000000, 'paid', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/8358cb67-71f6-4cea-a563-75e89818f254', '2021-08-21 08:46:32', '2021-08-21 15:46:32.329837');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `occupation` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password_hash` char(60) NOT NULL,
  `avatar_file_name` varchar(40) NOT NULL,
  `role` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `occupation`, `email`, `password_hash`, `avatar_file_name`, `role`, `created_at`, `updated_at`) VALUES
(1, 'dian', 'CMO', 'dian@gmail.com', '$2a$04$kSYIx2zBs59VmJd6g3NVaOCdA1NgFGRXr4cFwitTR2YFmTY1COJoq', 'images/1-logo.svg', 'user', '2021-07-29 16:30:33.915000', '2021-08-16 20:02:23.442301'),
(2, 'odon', 'CEO', 'odon@gmail.com', '$2a$04$gU7jaqYgfN0Mf7KoCNpASul9uCb5HtSkADxFsB.fzZAx7vMAl1COS', 'images/2-logo.svg', 'user', '2021-07-29 16:37:35.149000', '2021-08-16 20:02:39.427762'),
(3, 'test jwt', 'Architect', 'jwt@gmail.com', '$2a$04$..pMSBNAP/1lDMl4wiKGwufg0U85.9PE4yEwGMDbsNcccAsSmHCPu', 'images/3-logo@2x.png', 'user', '2021-07-30 22:37:01.946000', '2021-08-16 20:03:28.369237'),
(31, 'Julia Keeva', 'Product Designer', 'julia@bwa.com', '$2a$04$.i7IS/qDqjDPuFefxtt/yOHizAFJJ2uklc4g64Idi8MLJw2Ltbz7m', 'images/31-logo@2x.png', 'user', '2021-08-11 15:55:26.973000', '2021-08-16 20:03:39.480553'),
(32, 'themordhon', 'programmer', 'themordhon@gmail.com', '$2a$04$u1H5S0P7JTX4fGEPBePgEeTJvvGrX7kXSO44K1U8vQhfi9yvfkevW', 'images/32-logo@2x.png', 'user', '2021-08-12 14:00:51.203000', '2021-08-16 20:03:49.244274'),
(33, 'Umar Ghazi Alfatih', 'Petani', 'umarghaz@gmail.com', '$2a$04$tecshX4VzPbiLqwM458Br.e4vf3E4HBup9fSH2SGgirxs83mj8eL.', 'images/33-logo@2x.png', 'user', '2021-08-12 19:40:57.407000', '2021-08-16 20:03:57.687175'),
(34, 'James Sullivan', 'Drummer', 'james@gmail.com', '$2a$04$wEh5xGnu7E5B96bffmJWOe0j/lkgHwq8nHHBYOcD9pD3YAzI6gpPq', 'images/34-1623809960976.jpg', 'user', '2021-08-18 22:46:22.603852', '2021-08-18 22:47:10.918367'),
(52, 'fajri saripudin', 'designer', 'fajri@gmail.com', '$2a$04$t9ucmbRZDGVhDWSwjVSToeTmqr2hHUD.wxEqURiwA1a.hwOwH1uLS', 'images/52-logo@2x.png', 'user', '2021-08-21 14:17:25.926734', '2021-08-21 14:17:58.194885');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_images`
--
ALTER TABLE `campaign_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_users` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `campaign_images`
--
ALTER TABLE `campaign_images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
