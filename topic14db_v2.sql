-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: topic14db
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `noti_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answer_user_idx` (`user_id`),
  KEY `fk_answer_question_idx` (`question_id`),
  KEY `fk_answer_notification_idx` (`noti_id`),
  CONSTRAINT `fk_answer_notification` FOREIGN KEY (`noti_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `fk_answer_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'Trường ĐH Mở Tp. Hồ Chí Minh là Trường ĐH Công lập. Tiền thân của Trường ĐH Mở Tp. Hồ Chí Minh là Viện Đào tạo mở rộng, được thành lập theo quyết định số 451/TCCB ngày 15/6/1990 của Bộ trưởng Bộ giáo dục và đào tạo. Ngày 22/06/2006, theo quyết định số 146/2006/QĐ-TTg của Thủ tướng Chính phủ “ĐH Mở Bán công Tp. Hồ Chí Minh chuyển sang loại hình trường đại học Công lập” với tên gọi mới là Trường ĐH Mở Tp. Hồ Chí Minh.  ',1,3,'2023-05-01 07:30:00',14),(2,'Hiện tại Trường có 1 khu KTX tại cơ sở Long Bình, Biên Hòa – Đồng Nai, có sức chứa 400 Sinh viên, sử dụng cho sinh viên tham gia học Giáo dục Thể chất và Quốc phòng tại cơ sở Long Bình.',1,4,'2023-05-01 11:33:42',14),(3,'Thế mạnh nổi trội của trường là chương trình đào tạo được thiết kế theo hướng thực hành, thực tế, gắn với nhu cầu của xã hội, thị trường lao động. Đào tạo theo hệ thống tín chỉ, tạo điều kiện thuận lợi cho người học và có thể rút ngắn thời gian học.  Hệ thống học tập phù hợp với điều kiện và năng lực đặc biệt của người học.',1,6,'2023-05-01 11:34:31',14),(4,'Trường ĐH Mở Tp. HCM là trường ĐH công lập nên mức học phí được tính theo nghị định 49 của Chính phủ (mức học phí từng học kỳ tùy thuộc vào số tín chỉ sinh viên đăng ký). Mức học phí bình quân của khối ngành Kinh tế - xã hội: Khoảng 3,0 triệu đến 3,5 triệu đồng/Học kỳ; khối ngành Kỹ thuật - công nghệ: Khoảng 3,5 triệu đến 4,0 triệu đồng/Học kỳ. Sinh viên đóng học phí theo từng học kỳ (3 học kỳ/năm học).',1,8,'2023-05-01 11:35:12',14),(5,'Trường ĐH Mở Tp. HCM là trường công lập nên mọi chế độ chính sách đối với sinh viên của Trường sẽ được đảm bảo theo đúng tinh thần Nghị định 49/2010/NĐ-CP ngày 14/5/2010 của Chính Phủ (Quy định về miễn, giảm học phí, hỗ trợ chi phí học tập và cơ chế thu, sử dụng học phí đối với cơ sở giáo dục thuộc hệ thống giáo dục quốc dân từ năm học 2010 - 2011 đến năm học 2014 – 2015).',1,9,'2023-05-01 11:35:52',14),(6,'Theo thống kê và khảo sát sinh viên tốt nghiệp trong 3 năm trở lại đây thì tỷ lệ sinh viên có việc làm sau khi tốt nghiệp của trường ở tất cả các ngành đào tạo là 80%.',1,10,'2023-05-03 09:37:11',18);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'Trang chu','https://tuyensinh.ou.edu.vn/tmp/rscache/1110x475-dkxt2-01.png',NULL,_binary ''),(2,'Trang chu','https://tuyensinh.ou.edu.vn/tmp/rscache/1110x475-web ts 2023-v1-01.png','2023-03-04 15:15:00',_binary ''),(3,'tuyển sinh','https://res.cloudinary.com/dn9kcyifl/image/upload/v1682959849/ua2v9hayohzwitvgtnrt.png',NULL,_binary '');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tuyển sinh chính quy','2023-04-18 10:44:01'),(2,'Tuyển sinh liên thông','2023-04-20 20:55:13'),(3,'Tuyển sinh cao học','2023-04-20 20:55:13'),(4,'Tuyển sinh thạc sĩ','2023-04-20 20:55:13'),(5,'Tuyển sinh đào tạo từ xa','2023-04-20 20:55:13'),(6,'Giới thiệu','2023-04-20 20:55:13');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `parentCmt_id` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'hay',2,17,NULL,'2023-04-24 23:42:24'),(6,'dsds',2,16,NULL,'2023-05-02 23:48:01'),(7,'sdsdsd',2,16,NULL,'2023-05-03 00:04:23'),(8,'dsds',2,17,NULL,'2023-05-03 10:35:39'),(9,'good joob',2,30,NULL,'2023-05-03 21:16:19');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `embed_video` varchar(200) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Đào tạo sau đại học','  Khoa Đào tạo sau đại học Trường Đại học Mở TPHCM là nơi tổ chức đào tạo các chương trình sau đại học trong nước và liên kết ở ba lĩnh vực chính: kinh tế-quản trị, kỹ thuật-công nghệ, và xã hội-nhân văn. Các giá trị cốt lõi của Trường như khuyến khích người học sáng tạo, không ngừng học hỏi để mở rộng tri thức, hội nhập quốc tế, gắn kết thực tiễn, phục vụ cộng đồng, linh hoạt và thân thiện đã định hình nên mọi hoạt động giảng dạy, học tập và nghiên cứu của Khoa Đào tạo sau đại học.','http://sdh.ou.edu.vn/','https://www.youtube.com/embed/da8douuv0-M','2023-04-24 14:30:18','2023-05-02 16:32:22','https://res.cloudinary.com/dp50hyprx/image/upload/v1682321419/ohy761anndx0uexongbd.png',_binary ''),(3,'Công nghệ thông tin','Khoa Công Nghệ Thông Tin (CNTT) được thành lập từ tháng 09/1990 và là một trong những Khoa được thành lập đầu tiên của trường Đại Học Mở Tp. Hồ Chí Minh. Trải qua hơn 30 năm xây dựng và phát triển, hiện nay Khoa có đội ngũ giảng viên cơ hữu giàu kinh nghiệm và tận tâm gồm các Tiến sĩ, Thạc sĩ tốt nghiệp từ các trường danh tiếng trong và ngoài nước cùng với các giảng viên thỉnh giảng đến từ các trường Đại học, viện nghiên cứu uy tín ở TP HCM. Khoa đã đào tạo và cung cấp nguồn nhân lực có chất lượng cho xã hội với số lượng xấp xỉ 5.500 cử nhân khoa học hệ chính quy khối ngành Công nghệ thông tin (Khoa học máy tính, Tin học, Hệ thống thông tin quản lý) và hàng ngàn cử nhân Tin học hệ không chính quy.\r\nKhoa đào tạo nhân lực cho ngành CNTT có đạo đức, có kiến thức lý thuyết tốt, có kỹ năng thực hành thành thạo, có khả năng nắm bắt được những vấn đề mới của sự phát triển ngành, phục vụ sự nghiệp công nghiệp hóa hiện đại hóa đất nước thông qua quá trình tin học hóa các lĩnh vực quản lý kinh tế, quản lý sản xuất, quản lý xã hội, giáo dục, …','http://it.ou.edu.vn/','https://www.youtube.com/embed/6F6RGmVvfdM','2023-04-24 14:40:44','2023-04-24 14:40:44','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322044/yvmohmizekyni6mrsxwf.png',_binary ''),(4,'Kinh tế và Quản lý công','Khoa Kinh tế và Quản lý công luôn tự hào là một trong những khoa lớn mạnh nhất trong quá trình phát triển ba mươi năm qua của Trường đại học Mở thành phố Hồ Chí Minh. Để đáp ứng nhu cầu đào tạo, Khoa Kinh tế được tách ra từ Khoa Kinh tế - Quản trị Kinh doanh vào năm 2007. Với đà phát triển không ngừng, đến năm 2010, Khoa Kinh tế lại tiếp tục được đổi tên thành Khoa Kinh tế và Luật để phù hợp với hai ngành đào tạo của Khoa là ngành Kinh tế và ngành Luật Kinh tế. Cùng với sự lớn mạnh liên tục thì vào tháng 10 năm 2015 Khoa Kinh tế và Luật lại được tách thành hai đơn vị đào tạo là Khoa Luật và Khoa Kinh tế và Quản lý công.\r\nKhoa Kinh tế và Quản lý công là một trong những đơn vị đào tạo chủ lực của Trường đại học Mở thành phố Hồ Chí Minh với đa dạng cấp học từ cử nhân, thạc sĩ cho đến tiến sĩ. Khoa kinh tế và Quản lý công đã thực hiện đào tạo ngành Kinh tế ở cấp độ Đại học với bề dày từ năm 2006. Nhằm phát triển tối đa  năng lực của người học cũng như đáp ứng nhu cầu đa dạng của thị trường lao động, sau \r\n\r\ngiai đoạn học tập các môn học mang tính nền tảng thì sinh viên được tự do lựa chọn học tập chuyên sâu với bốn chuyên ngành: Kinh tế học, Kinh tế đầu tư, Kinh tế quốc tế và Quản lý công. Các chương trình đào tạo của Khoa luôn được thiết kế với quan điểm linh hoạt, chú trọng đổi mới phương pháp giảng dạy theo hướng: giảm khối lượng lý thuyết, tăng thời gian thảo luận và tự học theo phương châm lấy người học làm trung tâm của quá trình giảng dạy.','http://v1.ou.edu.vn/ktqlc/Pages/default.aspx','https://www.youtube.com/embed/hb1n9SwwzEk','2023-04-24 14:47:59','2023-04-24 14:47:59','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322478/nn8gafoeceflzlne5elz.png',_binary ''),(5,'Tài chính - Ngân hàng','Sự phát triển của hệ thống ngân hàng, các định chế tài chính phi ngân hàng và các công ty chứng khoán tạo nên những mảng màu tươi mới cho bức tranh kinh tế Việt Nam. Tuyển dụng nhân lực có chất lượng làm việc trong lĩnh vực tài chính – ngân hàng - chứng khoán là nhu cầu tất yếu của các doanh nghiệp trong ngành. Khoa Kế toán - Tài chính - Ngân hàng, được thành lập và thực hiện hoạt động đào tạo từ năm 2005, tách ngành Kế toán và đổi tên thành Khoa Tài chính - Ngân hàng từ năm 2009 với mục tiêu đào tạo nguồn nhân lực chất lượng cao nắm vững kiến thức kinh tế xã hội cơ bản, kiến thức chuyên sâu về ngành và chuyên ngành đủ đáp ứng nhu cầu sử dụng của các doanh nghiệp lĩnh vực tài chính – ngân hàng – chứng khoán. Khoa Tài chính - Ngân hàng thực hiện nhiệm vụ đào tạo 3 chuyên ngành: Tài chính doanh nghiệp, Đầu tư tài chính và Ngân hàng với các hệ đào tạo: Đại học chính quy tập trung, Văn bằng 2, Từ xa và Vừa làm vừa học. Chúng tôi luôn coi trọng chất lượng đào tạo, nỗ lực đổi mới chương trình đào tạo theo hướng hiện đại, áp dụng phương pháp giảng dạy lấy sinh viên là trung tâm của hoạt động giảng dạy, học tập.','http://tcnh.ou.edu.vn/','https://www.youtube.com/embed/zn2iY3zjULQ','2023-04-24 14:52:47','2023-04-24 14:52:47','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322767/m3tbee6btylbonzsdmrc.png',_binary ''),(6,'Đào tạo đặc biệt','Khoa Đào tạo đặc biệt (ĐTĐB) tiền thân là “Chương trình Đào tạo đặc biệt” được thành lập vào năm 2006, đào tạo chất lượng cao, nhằm cung cấp dịch vụ đào tạo đại học chất lượng, phương pháp đào tạo tiên tiến, chương trình đào tạo phù hợp với nhu cầu của xã hội và hội nhập với chương trình đào tạo của các trường đại học quốc tế.\r\nNgày 09 tháng 03 năm 2016, Bộ Giáo dục và Đào tạo xác nhận đề án đào tạo chất lượng cao trình độ đại học các ngành Quản trị kinh doanh, Tài chính- Ngân hàng, Kế toán, Luật kinh tế, Ngôn ngữ Anh của trường Đại học Mở Tp. Hồ Chí Minh đã đảm bảo đủ các tiêu chí và điều kiện quy định về đào tạo chất lượng cao trình độ đại học. Sau hơn 10 năm triển khai và hoạt động, Khoa ĐTĐB đã gặt hái nhiều thành công và cung cấp nguồn nhân lực chất lượng cao cho các doanh nghiệp và các tổ chức tài chính.','http://v1.ou.edu.vn/dacbiet/Pages/default.aspx','https://www.youtube.com/embed/P1qCo_QGMSo','2023-04-24 14:59:47','2023-04-24 14:59:47','https://res.cloudinary.com/dp50hyprx/image/upload/v1682323187/tpyi8lvcwebgdvucoqt1.jpg',_binary ''),(7,'Kế toán - Kiểm toán','Khoa Kế toán – Kiểm toán được thành lập năm 2010 trên cơ sở tách ra từ Khoa Kế toán – Tài chính – Ngân hàng, với mục đích tập trung vào phát triển đào tạo và nghiên cứu khoa học trong lĩnh vực kế toán – kiểm toán.\r\n\r\nKhoa Kế toán – Kiểm toán đào tạo và cung cấp nguồn nhân lực kế toán, tài chính, kiểm toán và tư vấn cho các doanh nghiệp sản xuất, kinh doanh, dịch vụ, các công ty kiểm toán và tư vấn cũng như các cơ quan hành chính sự nghiệp, phục vụ cho sự phát triển của nền kinh tế Việt Nam.','http://v1.ou.edu.vn/ktkt/Pages/default1.aspx','https://www.youtube.com/embed/1P2COG3oU2Y','2023-04-24 15:04:23','2023-04-24 15:04:23','https://res.cloudinary.com/dp50hyprx/image/upload/v1682323463/yk2w9qjuilocfdaejedo.jpg',_binary ''),(8,'Ngoại ngữ','Học tập là lấy người học làm trọng tâm chứ không phải là nhà Trường hay Giáo viên. Học tập là sự phối hợp và người học sẽ nhận được các lợi ích từ sự liên kết đào tạo giữa các cơ sở đào tạo bao gồm cả tài liệu giảng dạy và các chương trình liên kết. Học tập được xây dựng dựa trên nền tảng kiến thức và kỹ năng hiện hành. Học tập có thể thông qua giáo dục từ xa.','https://khoann.ou.edu.vn/','https://www.youtube.com/embed/lQSGkXcftJk','2023-04-24 15:37:15','2023-04-24 15:37:15','https://res.cloudinary.com/dp50hyprx/image/upload/v1683008405/Screenshot_2023-05-02_131814_sgeva5.png',_binary ''),(9,'Xây dựng','Khoa Xây Dựng - Trường ĐH Mở TP.HCM, được thành lập từ năm 1992. Tiền thân là Khoa Công thôn, Khoa Kỹ thuật Công nghệ và Khoa Xây dựng - Điện. Đến năm 2018 chính thức có tên là Khoa Xây Dựng. Hiện tại, Có 31 viên chức với 1100 SV chính quy, 300 SV hệ từ xa - VHVL, 60 HV Cao học và 2 nghiên cứu sinh đang theo học. Khoa hiện đang vận hành nhiều chương trình đào tạo liên quan đến ngành Kỹ thuật xây dựng và Quản lý xây dựng cho bậc đại học, thạc sĩ và tiến sĩ.','http://ce.ou.edu.vn/','https://www.youtube.com/embed/BKKZxsRYGyc','2023-04-24 15:40:39','2023-04-24 15:40:39','https://res.cloudinary.com/dp50hyprx/image/upload/v1682325639/ws8vix44pqjym5bmkdmm.png',_binary ''),(10,'Công nghệ sinh học','Được thành lập từ tháng 6 năm 1991, đầu tiên được đặt tên là “Ban Kỹ thuật sinh học”. Năm 1993, Trường có quyết định đổi tên thành “Khoa Công nghệ sinh học”, là Trường đầu tiên tại Việt Nam được Bộ Giáo dục và Đào tạo cho phép đào tạo ngành Công nghệ sinh học.\r\nTrong suốt quá trình hình thành, xây dựng và phát triển, Khoa luôn cải tiến chương trình đào tạo nhằm đáp ứng kịp yêu cầu của xã hội. Hiện nay, Khoa đang triển khai đào tạo bậc đại học Công nghệ Sinh học hệ đại trà, chất lượng cao, đào tạo từ xa với 3 chuyên ngành chính Công nghệ Sinh học Y dược, Công nghệ Sinh học Nông nghiệp - Môi trường, Công nghệ Thực phẩm. Bên cạnh đó, Khoa đã tổ chức đào tạo bậc Thạc sĩ Ngành Công nghệ Sinh học từ năm 2018.\r\n\r\n','http://v1.ou.edu.vn/cnsh/Pages/defaultnew.aspx','https://www.youtube.com/embed/O48PF8gKe6w','2023-04-24 15:44:28','2023-04-24 15:44:28','https://res.cloudinary.com/dp50hyprx/image/upload/v1682325869/pwvsttiiipgbrczfnhls.bmp',_binary ''),(11,'Luật','Khoa Luật được thành lập theo Quyết định 1328/QĐ-ĐHM ngày 09 tháng 10 năm 2015 của Hiệu trưởng Trường Đại học Mở Thành phố Hồ Chí Minh trên cơ sở tách ra từ Khoa Kinh tế và Luật (được thành lập vào năm 2009).\r\nKhoa Luật đào tạo hai ngành: ngành Luật và ngành Luật Kinh tế với mục tiêu đào tạo cử nhân Luật và cử nhân Luật Kinh tế có trình độ vững vàng về kiến thức luật học và kiến thức bổ trợ khác để có thể thích ứng với tất cả các công việc liên quan đến pháp lý, đồng thời được chuyên sâu theo lựa chọn các chuyên ngành: chuyên ngành pháp luật thương mại, chuyên ngành pháp luật dân sự, chuyên ngành pháp luật hành chính. Bên cạnh đó, Khoa chú trọng rèn luyện các kỹ năng chuyên môn và các kỹ năng mềm, hình thành thái độ đúng đắn đối với nghề nghiệp, cộng đồng, xã hội.','http://khoaluat.ou.edu.vn/','https://www.youtube.com/embed/qWTrVBq2gwE','2023-04-24 15:48:19','2023-04-24 15:48:19','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326098/uybkw0vb6mbnpmsuaqoy.png',_binary ''),(12,'Quản trị kinh doanh','Khoa Quản trị Kinh doanh hiện có khoảng 3.000 sinh viên theo học hệ đào tạo chính quy tập trung và hơn 5.000 sinh viên đang theo học hệ từ xa (truyền thống và trực tuyến) và vừa làm - vừa học. Những năm qua, Khoa Quản trị Kinh doanh không ngừng nỗ lực cải tiến nội dung giảng dạy, biên soạn giáo trình, tài liệu học tập, áp dụng nhiều phương pháp giảng dạy tiên tiến. Ngoài ra, sinh viên còn được tạo điều kiện rèn luyện kỹ năng, gắn kết thực tế qua việc tham gia các chương trình học thuật, tham quan doanh nghiệp và nhiều hoạt động câu lạc bộ, đội nhóm phong phú do Khoa tổ chức.','http://kqtkd.ou.edu.vn/','https://www.youtube.com/embed/YwvPJXQmdzI','2023-04-24 15:52:37','2023-04-24 15:52:37','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326359/vdgiotxshoncof6q62kx.png',_binary ''),(13,'XHH - CTXH - ĐNA','Năm 1991, khoa Đông Nam Á học đào tạo ngành Đông Nam Á học với mục tiêu đào tạo về khu vực học, cung cấp kiến thức về các lĩnh vực của khu vực Đông Nam Á. Năm 1992, khoa Phụ nữ học đào tạo ngành Xã hội học nhằm trang bị kiến thức, giúp sinh viên nắm vững phương pháp nghiên cứu xã hội và nhận diện, phân tích các vấn đề xã hội. Năm 2003, khoa Phụ nữ học đổi tên thành khoa Xã hội học. Đến năm 2004, khoa Xã hội học mở ngành đào tạo Công tác xã hội. Năm 2010, khoa Xã hội học đổi tên thành khoa Xã hội học và Công tác xã hội. Năm 2011, khoa chính thức mang tên gọi khoa Xã hội học – Công tác xã hội – Đông Nam Á.','http://xhh.ou.edu.vn/','https://www.youtube.com/embed/Uko2vJ11mdE','2023-04-24 15:58:56','2023-04-24 15:58:56','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326735/nhx07fqxd3bwgjyxgfcn.png',_binary ''),(14,'gggg','hhhhh','hghhh','','2023-04-24 19:27:36','2023-04-24 20:36:10','https://res.cloudinary.com/dp50hyprx/image/upload/v1682339257/y1m2ngxau8r5xagsn2ar.jpg',_binary '\0'),(15,'ffff12345','fffff333','ffff444','','2023-04-24 19:39:01','2023-04-29 07:11:40','https://res.cloudinary.com/dp50hyprx/image/upload/v1682339941/ezqrftppgcyxotrhfsvr.jpg',_binary '\0'),(16,'Công nghệ thực phẩm','tttt','tttt','','2023-04-25 14:17:39','2023-04-25 14:18:21','https://res.cloudinary.com/dp50hyprx/image/upload/v1682407062/u4nfrzm3bjlw7hhb0b5f.png',_binary '\0'),(17,'Y tế công cộng','Khoa Y tế Công cộng – Đại học Y Dược TP.HCM được thành lập theo quyết định số 799/1999/QĐ-BYT ký ngày 23 tháng 3 năm 1999 của Bộ trưởng Bộ Y tế, trên cơ sở sáp nhập Khoa Tổ chức – Quản lí Y tế của Viện Vệ sinh – Y tế Công cộng và Bộ môn Y tế công cộng thuộc Khoa Y – Đại học Y Dược TP.HCM. Trụ sở của khoa hiện đặt tại Viện Y tế công cộng TP. HCM và lầu 12A – tòa nhà Y Nha, Đại học Y Dược Tp. HCM.','http://v1.ou.edu.vn/ktqlc/Pages/default.aspx','https://www.youtube.com/embed/zn2iY3zjULQ','2023-04-29 10:08:54','2023-04-29 16:14:16','https://res.cloudinary.com/dp50hyprx/image/upload/v1682737735/uaqsna2xlulfdupu0uiu.jpg',_binary '');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `majors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (1,3,'7480101','Khoa học máy tính'),(2,3,'7480201','Công nghệ thông tin'),(3,3,'7480201','Công nghệ thông tin tăng cường tiếng nhật'),(4,3,'7340405','Hệ thống thông tin quản lý'),(5,6,'7480101C','Khoa học máy tính (Chất lượng cao)'),(6,5,'7340201','Tài chính - Ngân hàng'),(7,6,'7340201C','Tài chính - Ngân hàng (Chất lượng cao)'),(8,7,'7340301','Kế toán'),(9,6,'7340301C','Kế toán (Chất lượng cao)'),(10,7,'7340302','Kiểm toán'),(11,11,'7380101','Luật'),(12,11,'7380107','Luật kinh tế'),(13,6,'7380107C','Luật kinh tế (Chất lượng cao)'),(14,8,'7220201','Ngôn ngữ Anh'),(15,6,'7220201C','Ngôn ngữ Anh (Chất lượng cao)'),(16,8,'7220204','Ngôn ngữ Trung'),(17,6,'7220204C','Ngôn ngữ Trung (Chất lượng cao)'),(18,8,'7220209','Ngôn ngữ Nhật'),(19,6,'7220209C','Ngôn ngữ Nhật (Chất lượng cao)'),(20,8,'7220210','Ngôn ngữ Hàn'),(21,10,'7420201','Công nghệ sinh học'),(22,6,'7420201C','Công nghệ sinh học (Chất lượng cao)'),(23,10,'7540101','Công nghệ thực phẩm'),(24,4,'7310101','Kinh tế'),(25,6,'7310101C','Kinh tế (Chất lượng cao)'),(26,4,'7340403','Quản lý công'),(27,12,'7340101','Quản trị kinh doanh'),(28,6,'7340101C','Quản trị kinh doanh (Chất lượng cao)'),(29,12,'7340115','Marketing'),(30,12,'7340120','Kinh doanh quốc tế'),(31,12,'7510605','Logistics và Quản lý chuỗi cung ứng'),(32,12,'7810101','Du lịch'),(33,12,'7340404','Quản trị nhân lực'),(34,9,'7510102','Công nghệ kỹ thuật công trình xây dựng'),(35,6,'7510102C','Công nghệ kỹ thuật công trình xây dựng (Chất lượng cao)'),(36,9,'7580302','Quản lý xây dựng'),(37,13,'7310301','Xã hội học'),(38,13,'7760101','Công tác xã hội'),(39,13,'7310620','Đông Nam Á'),(47,16,'7480101','Công nghệ thực phẩm'),(51,17,'7480201','Dinh dưỡng');
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `isRead` bit(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_ibfk_1` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,'Buổi livestream tư vấn tuyển sinh','Link: https://www.youtube.com/live/1rN-PfHUzYI?feature=share','2023-04-29 12:39:10',NULL,'2023-04-30 09:30:00',NULL),(4,1,'Buổi livestream tư vấn tuyển sinh','Link: https://algonomy.com/blogs/retail/how-machine-learning-improves-retail-demand-forecasting/','2023-04-29 13:43:58',NULL,'2023-04-30 14:30:00',NULL),(5,1,'Buổi livestream tư vấn tuyển sinh','Link: https://algonomy.com/blogs/retail/how-machine-learning-improves-retail-demand-forecasting/','2023-04-30 13:48:05',NULL,'2023-04-30 15:30:00',NULL),(10,1,'Giải đáp thắc mắc','Quý phụ huynh cùng các bạn học sinh thân mến. Nếu mọi người có những thắc mắc về vấn đề tuyển sinh của trường vui lòng đặt câu hỏi trong bài đăng này.','2023-04-29 15:18:55',NULL,'2023-04-30 21:30:00','2023-04-30 22:30:00'),(11,1,'Giải đáp thắc mắc','Quý phụ huynh cùng các bạn học sinh thân mến. Nếu mọi người có những thắc mắc về vấn đề tuyển sinh của trường vui lòng đặt câu hỏi trong bài đăng này.','2023-04-29 21:31:29',NULL,'2023-04-30 21:27:00','2023-04-30 22:27:00'),(12,1,'Thông báo buổi livestream tư vấn tuyển sinh','Quý Phụ Huynh và Học Sinh quan tâm có thể đặt câu hỏi trước khi buổi livestream diễn ra. Nhân viên nhà trường sẽ tổng hợp và giải đáp trong buổi phát sóng.','2023-04-30 08:22:30',NULL,'2023-05-01 08:22:00',NULL),(14,1,'Giải đáp thắc mắc','Quý Phụ Huynh và Học Sinh cần biết thêm thông tin về vấn đề tuyển sinh của trường vui lòng đặt câu hỏi trong bài đăng này để được giải đáp.','2023-05-01 07:19:57',NULL,'2023-05-01 07:19:00','2023-05-02 07:19:00'),(18,1,'Giải đáp thắc mắc','Quý phụ huynh và học sinh cần tìm hiểu về vấn đề tuyển sinh của trường vui lòng đặt câu hỏi trong bài đăng này.','2023-05-03 09:24:43',NULL,'2023-05-03 09:26:00','2023-05-04 09:26:00');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Giới thiệu ','Được thành lập vào năm 1990 và trở thành trường đại học công lập từ năm 2006, đến nay Trường Đại học Mở Thành phố Hồ Chí Minh là trường đại học đa ngành trực thuộc Bộ Giáo dục và Đào tạo, có nhiệm vụ đào tạo đại học và sau đại học, với các hình thức đào tạo chính quy và giáo dục thường xuyên, đào tạo các điểm vệ tinh, nhằm đáp ứng nhu cầu học tập đa dạng của xã hội, góp phần tăng cường đội ngũ cán bộ khoa học-kỹ thuật cho đất nước và tương lai.',NULL,6,NULL,NULL,NULL,NULL,NULL,'2023-05-01 12:18:35',''),(3,'Lý do chọn OU','HCMC-OU được thành lập vào năm 1990 và chính thức trở thành trường công lập vào năm 2006. Với 30 năm kinh nghiệm trong hoạt động đào tạo, Trường đã không ngừng phấn đấu, hợp tác và phát triển để cung cấp cho người học các chương trình học đa dạng và chất lượng, góp phần thực hiện mục tiêu quốc gia về xã hội học tập và học tập suốt đời. ',3,6,NULL,NULL,NULL,NULL,'2023-04-03 12:45:00',NULL,NULL),(7,'THÔNG TIN TUYỂN SINH NĂM 2023 TRƯỜNG ĐẠI HỌC MỞ TP. HCM - (MÃ TRƯỜNG: MBS)','Thông tin tuyển sinh Đại học chính quy năm 2023 \r\n\r\nTrường Đại học Mở Tp.HCM thông báo phương án tuyển sinh đại học chính quy năm 2023 (dự kiến) của Trường như sau:\r\n\r\nChỉ tiêu dự kiến: 5.000\r\nMã trường: MBS\r\n\r\n      1. Đối tượng tuyển sinh:\r\n\r\n          - Thí sinh đã tốt nghiệp chương trình THPT của Việt Nam (hình thức giáo dục chính quy hoặc giáo dục thường xuyên) hoặc đã tốt nghiệp trình độ trung cấp (trong đó, người tốt nghiệp trình độ trung cấp nhưng chưa có bằng tốt nghiệp THPT phải học và thi đạt yêu cầu đủ khối lượng kiến thức văn hóa THPT theo quy định của Luật Giáo dục và các văn bản hướng dẫn thi hành) hoặc đã tốt nghiệp chương trình THPT của nước ngoài (đã được nước sở tại cho phép thực hiện, đạt trình độ tương đương trình độ THPT của Việt Nam) ở nước ngoài hoặc ở Việt Nam (sau đây gọi chung là tốt nghiệp THPT).\r\n\r\n         - Có đủ sức khoẻ để học tập theo quy định hiện hành. Đối với người khuyết tật được cấp có thẩm quyền công nhận bị dị dạng, dị tật, suy giảm khả năng tự lực trong sinh hoạt và học tập thì Hiệu trưởng xem xét, quyết định cho dự tuyển vào các ngành học phù hợp với tình trạng sức khoẻ.\r\n\r\n       2. Phạm vi tuyển sinh:\r\n\r\nTrường Đại học Mở Tp.HCM tuyển sinh trên cả nước và quốc tế.\r\n\r\n      3. Phương thức xét tuyển:\r\n\r\nNhóm các phương thức xét tuyển theo kế hoạch chung của Bộ GD&ĐT:\r\nPT1: Xét tuyển thẳng, ưu tiên xét tuyển theo Quy chế tuyển sinh của Trường và Bộ GD&ĐT.\r\n\r\nPT2: Xét tuyển theo Kết quả thi tốt nghiệp THPT.\r\n\r\nNhóm các phương thức theo kế hoạch xét tuyển riêng của Trường, các phương thức xét tuyển được ưu tiên theo thứ tự như sau:\r\nPT1: Ưu tiên xét tuyển đối với thí sinh có:\r\n\r\n+ Bằng tú tài quốc tế (IB) điểm từ 26;\r\n\r\n+ Chứng chỉ quốc tế A-Level của Trung tâm khảo thí ĐH Cambridge (Anh) theo điểm 3 môn thi (trở lên) đảm bảo mức điểm mỗi môn thi đạt từ C trở lên.\r\n\r\n+ Kết quả trong kỳ thi chuẩn hóa SAT (Scholastic Assessment Test, Hoa kỳ) đạt điểm từ 1100/1600.\r\n\r\nPT2: Ưu tiên xét tuyển học sinh Giỏi THPT (nhóm 1 và nhóm 2) có chứng chỉ Ngoại ngữ quốc tế theo quy định.\r\n\r\nPT3: Ưu tiên xét tuyển học sinh Giỏi THPT (nhóm 1 và nhóm 2).\r\n\r\nPT4: Ưu tiên xét tuyển kết quả học bạ THPT có chứng chỉ quốc tế.\r\n\r\nPT5: Xét tuyển học bạ THPT.',NULL,1,NULL,_binary '',NULL,NULL,'2023-05-01 10:55:58',NULL,'https://res.cloudinary.com/dn9kcyifl/image/upload/v1682913359/sgnwaxdelpdfuz3qznyv.png'),(8,'Tổng hợp thông tin Tuyển sinh ĐHCQ năm 2023',' \r\nI. ĐẠI HỌC CHÍNH QUY\r\n\r\n- Văn bằng chính quy: Kỹ sư, Cử nhân;\r\n\r\n- Thông tin tuyển sinh đại học chính quy năm 2022 : <<Chi tiết>>\r\n\r\n- Thông báo về việc tuyển sinh Đại học chính quy 2022 phương thức ưu tiên xét tuyển học sinh giỏi, xét tuyển kết quả học tập THPT (Học bạ), ưu tiên xét tuyển kết quả học tập THPT có chứng chỉ ngoại ngữ và ưu tiên xét tuyển học sinh có chứng chỉ quốc tế: <<Chi tiết>>\r\n\r\nII. CHƯƠNG TRÌNH LIÊN KẾT:\r\n\r\n1. Tuyển sinh chương trình liên kết Đại học Rouen Normandie, Pháp\r\n\r\n- Văn bằng: Cử nhân nghề nghiệp thương mại quốc tế (do trường ĐH Rouen Normandie, Pháp cấp).\r\n\r\n- Thông báo tuyển sinh: <<Chi tiết>>\r\n\r\n2. Tuyển sinh chương trình liên kết Đại học Flinders, Úc\r\n\r\n- Văn bằng: Cử nhân kinh doanh, Cử nhân thương mại, Cử nhân ngôn ngữ (do trường ĐH Flinders, Úc cấp).\r\n\r\n- Thông báo tuyển sinh: <<Chi tiết>>\r\n\r\n3. Tuyển sinh chương trình liên kết Đại học Bond, Úc\r\n\r\n- Văn bằng: Cử nhân kinh doanh, Cử nhân thương mại,  (do trường ĐH Bond, Úc cấp).\r\n\r\n- Thông báo tuyển sinh: <<Chi tiết>>',NULL,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:08:12',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-unnamed.png'),(9,'Thông báo nhận hồ sơ xét tuyển theo Đề án tuyển sinh riêng (Học bạ) năm 2023','1. Nguyên tắc đăng ký xét tuyển\r\n\r\n- Các phương thức được xét tuyển trong cùng 1 đợt.\r\n\r\n- Xét lần lượt các phương thức theo thứ tự ưu tiên (từ phương thức 1 đến phương thức 5) và điểm xét tuyển từ cao xuống thấp đến khi hết chỉ tiêu.\r\n\r\n- Thí sinh được xét bình đẳng, không phân biệt thứ tự ưu tiên của nguyện vọng đăng ký.\r\n\r\n- Thí sinh (căn cứ theo số Căn cước công dân) được đăng ký xét tuyển theo một phương thức duy nhất, được đăng ký tối đa 03 nguyện vọng (NV) và phải xếp theo thứ tự ưu tiên từ cao xuống thấp (NV1 là NV ưu tiên cao nhất); thí sinh chỉ có tên trúng tuyển (có điều kiện) 01 (một) NV duy nhất.\r\n\r\nLưu ý: Thí sinh phải sử dụng số “Căn cước công dân” hoặc “Mã định danh cá nhân” ĐÃ đăng ký dự thi THPT Quốc gia trên hệ thống quản lý thi của Bộ GD&ĐT ( http://thisinh.thitotnghiepthpt.edu.vn).\r\n    - Thí sinh đọc kỹ các quy định, ngưỡng điểm nhận hồ sơ... trước khi đăng ký xét tuyển tại đây. \r\n2. Phương thức nộp hồ sơ và lệ phí xét tuyển: \r\n\r\na) Thí sinh nộp hồ sơ đăng ký xét tuyến trực tuyến (TẠI ĐÂY) và không phải nộp hồ sơ giấy về trường. Hệ thống đăng ký xét tuyển trực tuyến sẽ mở đến 17g00 ngày 31/05/2023 (địa chỉ trang đăng ký sẽ được công bố sau)\r\n\r\nb) Lệ phí xét tuyển: KHÔNG CÓ. \r\n\r\nc) Thời gian công bố kết quả (dự kiến): 20/06/2023.\r\n\r\nLưu ý:\r\n\r\n- Thí sinh cung cấp chính xác Số CCCD/Mã định danh và địa chỉ email để đăng ký xét tuyển. Địa chỉ email được sử dụng trong trường hợp điều chỉnh thông tin, nhận thông báo và kết quả xét tuyển. \r\n\r\n- NGAY sau khi đăng ký, thí sinh sẽ nhận được email xác nhận tự động từ nhà trường. Quá trình đăng ký chỉ hoàn tất khi thí sinh nhận được email này. Trường hợp KHÔNG nhận được email xác nhận, thí sinh kiểm tra trong mục Spam (Thư rác).\r\n\r\n- Thí sinh chịu hoàn toàn trách nhiệm trước các thông tin đã nhập trên hệ thống đăng ký. Sau khi nhập học, nhà trường tiến hành hậu kiểm. Trường hợp có bất kỳ sai sót gì nhà trường sẽ ra quyết định kỷ luật và từ chối cho thí sinh nhập học.\r\n\r\n- Nhà trường sẽ cập nhật kết quả xét tuyển (để thí sinh đăng ký nguyện vọng) cổng thông tin tuyển sinh của Bộ GD&ĐT căn cứ theo số CCCD/Mã định danh và các thông tin thí sinh đã nhập.',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:08:55',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-N.i.M-6869.jpg'),(10,'Thông báo tiếp nhận Tân sinh viên Khóa 2022','THÔNG BÁO\r\nVề việc tiếp nhận Tân sinh viên Khóa 2022\r\nĐể tiết kiệm thời gian đi lại cho thí sinh và phụ huynh, cũng như đảm bảo an toàn trong tình hình dịch bệnh Covid-19 đang có dấu hiệu trở lại, Trường Đại học Mở Thành phố Hồ Chí Minh (sau đây gọi là Trường) tổ chức tiếp nhận tân sinh viên 2022 theo hình thức trực tuyến.\r\n\r\n- Đối tượng làm thủ tục nhập học: Tất cả các thí sinh đã Tốt nghiệp THPT đủ điều kiện trúng tuyển theo các phương thức xét tuyển vào Trường, đã đăng ký nhập học qua cổng thông tin tuyển sinh của Bộ Giáo dục và Đào tạo.\r\n\r\n- Thời gian hoàn tất hồ sơ (bao gồm đóng học phí) và gởi về trường: Đến 17h00 ngày 30 tháng 09 năm 2022 (tính theo dấu bưu điện).\r\n\r\n- Tân sinh viên 2022 thuộc đối tượng trên làm thủ tục nhập học theo các hướng dẫn đính kèm. Trong thông báo này bao gồm các HƯỚNG DẪN sau\r\n\r\n+ A. Hướng dẫn Tân sinh viên Khóa 2022 làm thủ tục nhập học trực tuyến.\r\n\r\n+ B. Hướng dẫn chuẩn bị các minh chứng để hưởng chế độ ưu tiên trong tuyển sinh.\r\n\r\n+ C. Hướng dẫn Tân sinh viên nộp hồ sơ xét miễn giảm môn học (Tiếng Anh không chuyên, Ngoại ngữ hai, Tin học đại cương và môn học khác).\r\n\r\n+ D. Hướng dẫn sử dụng Web nhà trọ cho sinh viên.\r\n\r\n+ E. Hướng dẫn về hồ sơ học bổng - chế độ chính sách.',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:09:41',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-Thong tin nhap hoc-01.png'),(11,'Thông báo V/v tham gia học “Tuần sinh hoạt công dân - SV” năm học 2022-2023','Phòng Công tác sinh viên thông báo tham gia học \"Tuần lễ sinh hoạt công dân - SV\" năm học 2014 - 2015\r\n\r\nThực hiện kế hoạch số 979/KH-ĐHM ngày 28/8/2014 về “ Tuần sinh hoạt công dân - SV” năm học 2014 – 2015; Phòng Công tác sinh viên thông báo một số nội dung như sau:\r\n\r\nTất cả sinh viên các Khóa phải tham dự đúng giờ theo lịch:\r\n-         Buổi sáng: từ 7h00 đến 11h00\r\n\r\n-         Buổi chiều: từ 13h00 đến 17h00\r\n\r\n-         Buổi tối: từ 17h00 đến 21h00\r\n\r\nSinh viên tham dự phải đem thẻ sinh viên để thực hiện điểm danh, làm bài thu hoạch và viết cam kết nộp cho Ban cán sự lớp và gửi về Văn phòng Khoa chậm nhất 5 ngày sau khi kết thúc đợt học để ghi nhận Đánh giá kết quả rèn luyện online năm học 2014 - 2015.\r\nCác Khoa cử chuyên viên phối hợp cùng Phòng Công tác sinh viên theo dõi và quản lý lớp theo đúng nội dung của kế hoạch.\r\nĐề nghị toàn thể sinh viên nghiêm túc thực hiện. ',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:10:38',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-N.I.M-8167.jpg'),(12,'Mức thu học phí hệ đại học chính quy khóa 2015, năm học 2015-2016','THÔNG BÁO\r\n\r\nVề mức thu học phí hệ đại học chính quy khóa 2015, năm học 2015-2016\r\n\r\nTrường Đại học Mở TP. Hồ Chí Minh thông báo mức thu học phí năm học 2015 -2016 như sau:\r\n\r\n1. Học phí đối với đào tạo trình độ đại học chính quy khóa tuyển sinh năm 2015 như sau:\r\n\r\nNhóm học phần của các ngành:  Xã hội học, Công tác xã hội, Đông Nam Á học, Kinh tế học: 210.000đ/tín chỉ. Mức thu bình quân từ 9 – 10 triệu đồng/năm tùy theo ngành.\r\nNhóm học phần của các ngành: Quản trị kinh doanh, Tài chính – Ngân hàng, Kế Toán – Kiểm toán, Luật kinh tế: 340.000đ/tín chỉ. Mức thu bình quân từ 12 – 13 triệu đồng/năm tùy theo ngành.\r\nNhóm học phần của các ngành: Công nghệ thông tin, Xây dựng, Quản lý xây dựng, Công nghệ sinh học, Hệ thống thông tin quản lý: 360.000đ/tín chỉ. Mức thu bình quân từ 13 – 14 triệu đồng/năm tùy theo ngành.\r\nNhóm học phần của các ngành: Ngoại ngữ (Ngành tiếng Anh, tiếng Trung, và tiếng Nhật): 380.000đ/tín chỉ. Mức thu bình quân từ 14 – 15 triệu đồng/năm tùy theo ngành.\r\nHọc phí được đóng theo từng học kỳ và mỗi năm học 03 học kỳ.',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:11:35',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-thanhtoantructuyen.jpg'),(13,'Thông báo v/v tuyển thẳng vào Đại học năm 2017','THÔNG BÁO\r\n\r\nVề việc tuyển thẳng vào Đại học, Cao đẳng năm 2017\r\n\r\nCăn cứ theo Quy chế tuyển sinh đại học hệ chính quy; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên hệ chính quy ban hành kèm theo Thông tư số 05/2017/TT-BGDĐT ngày 25 tháng 01 năm 2017 của Bộ trưởng Bộ Giáo dục và Đào tạo;\r\n\r\nCăn cứ công văn số 603/BGDĐT-GDĐH ngày 17 tháng 02 năm 2017 của Bộ Giáo dục và Đào tạo về việc hướng dẫn công tác tuyển sinh đại học hệ chính quy; tuyển sinh cao đẳng nhóm ngành đào tạo giáo viên hệ chính quy năm 2017;\r\n\r\nCăn cứ công văn số 136/TB-BGDĐT ngày 07 tháng 3 năm 2017 của Bộ Giáo dục và Đào tạo thông báo về việc xác định và đăng ký chỉ tiêu tuyển sinh năm 2017;\r\n\r\nTrường Đại học Mở Tp. HCM thông báo điều kiện xét tuyển thẳng và ưu tiên xét tuyển của thí sinh trong kỳ thi tuyển sinh Đại học năm 2017 như sau:',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:12:01',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-2907-01.png'),(14,'Thông báo về việc xét tuyển thẳng học sinh các trường THPT chuyên, năng khiếu năm 2018','THÔNG BÁO\r\n\r\nVề việc xét tuyển thẳng học sinh các trường Trung học Phổ thông chuyên, năng khiếu năm 2018\r\n\r\nTrường Đại học Mở thành phố Hồ Chí Minh thông báo về việc xét tuyển thẳng học sinh các trường THPT chuyên, năng khiếu trong kỳ thi tuyển sinh Đại học năm 2018 như sau:\r\n\r\n1. Đối tượng: Học sinh các trường THPT chuyên, năng khiếu trực thuộc trường đại học, trực thuộc tỉnh thành phố trên toàn quốc (Phụ lục 1 - xem chi tiết).\r\n\r\n2. Điều kiện đăng ký xét tuyển:\r\n\r\n- Tốt nghiệp THPT năm 2018;\r\n\r\n- Có hạnh kiểm tốt 03 năm THPT (lớp 10, 11, 12);\r\n\r\n- Kết quả học lực 03 năm THPT (lớp 10, 11, 12) đạt loại giỏi; hoặc là thành viên đội tuyển của Trường hoặc tỉnh tham dự kỳ thi học sinh Giỏi Quốc gia.\r\n\r\n- Điểm trung bình (ĐTB) chung của các môn học của 3 năm học THPT trong tổ hợp xét tuyển không nhỏ hơn 7,0.\r\n\r\n- Điểm trung bình chung môn học được xác định như sau:\r\n\r\nĐiểm TB chung môn học = .(ĐTB môn lớp 10 + ĐTB môn lớp 11 + ĐTB môn lớp 12)/3',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:12:44',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-unnamed.png'),(15,'Thông báo V/v Gia hạn thời gian nhận hồ sơ nhập học ĐH chính quy khóa 2021 (Đợt 1)','THÔNG BÁO\r\nV/v gia hạn thời gian nhận hồ sơ nhập học cho thí sinh trúng tuyển\r\nvào Đại học chính quy khóa 2021 - Đợt 1\r\n(Đợt xét tuyển học bạ từ ngày 15/4 đến 17/5/2021)\r\n \r\n   Căn cứ theo tình hình dịch bệnh COVID-19 đang diễn ra phức tạp, một số thí sinh trong vùng dịch chưa gửi hồ sơ nhập học đúng thời hạn.\r\n   Trường Đại Mở Thành phố Hồ Chí Minh (sau đây gọi là Trường) thông báo về việc gia hạn thời gian nộp hồ sơ đối với các thí sinh trúng tuyển khóa 2021 đợt 1 (thay cho các thông báo trước đây) như sau:\r\n1. Gia hạn thời gian nộp hồ sơ nhập học:\r\n\r\na. Đối tượng: Thí sinh đã tốt nghiệp THPT đợt 1, hoàn tất hồ sơ nhập học trực tuyến (online) và đóng học phí trước 17g00 ngày 04/8/2021.\r\n\r\nb. Thời gian nộp hồ sơ:\r\n\r\n- Đối với Giấy chứng nhận kết quả thi Tốt nghiệp THPT năm 2021 (GCNKQ - bao gồm các thí sinh tự do có tham dự kỳ thi Tốt nghiệp THPT năm 2021):\r\n\r\n+ Nộp bản chính qua đường chuyển phát nhanh về Trường (Số 97 Võ Văn Tần, P.Võ Thị Sáu, Q.3, Tp.HCM) trước 17g00 ngày 25/8/2021 (theo dấu bưu điện).\r\n\r\n+ Hoặc gửi ảnh chụp (scan) đến email: tuyensinh@ou.edu.vn, tiêu đề ghi rõ “Nộp Giấy chứng nhận kết quả - Mã số sinh viên” trước 17g00 ngày 25/8/2021 và gửi bản chính qua đường chuyển phát nhanh trước 17g00 ngày 22/9/2021 (theo dấu bưu điện). (Thí sinh gởi email đúng tiêu đề theo hướng dẫn để nhà trường thuận tiện trong việc phân loại, tránh sai sót)\r\n\r\nSau thời hạn này nếu thí sinh không gửi Giấy chứng nhận kết quả thi tốt nghiệp THPT năm 2021 về Trường xem như thí sinh từ chối nhập học.\r\n\r\n- Các giấy tờ còn lại trong hồ sơ sinh viên: gửi chuyển phát nhanh về Trường trước ngày 22/9/2021 (theo dấu bưu điện)',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:14:22',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-Dang ky nguyen vong.png'),(16,'ĐĂNG KÝ Ưu tiên XT học sinh Giỏi; Ưu tiên/Xét tuyển HỌC BẠ; Xét tuyển IB, A-Level, SAT năm 2021','HỘI ĐỒNG TUYỂN SINH\r\nTRƯỜNG ĐẠI HỌC MỞ THÀNH PHỐ CHÍ MINH\r\nThông báo về việc nhận Hồ sơ xét tuyển Học sinh Giỏi; Xét tuyển kết quả học tập các môn học THPT (học bạ) và Điểm tú tài quốc tế IB, chứng chỉ A-Level, SAT như sau:\r\n\r\n1) Thí sinh Đăng ký trực tuyến (không có lệ phí, hồ sơ sẽ bổ sung khi nhập học): << tại đây>> (Đến 20g00 ngày 17/05/2021)\r\n\r\n- Thí sinh cung cấp chính xác Số CMND (Số CCCD) và địa chỉ email để đăng ký xét tuyển và sử dụng trong trường hợp điều chỉnh thông tin, nhận thông báo và kết quả xét tuyển.\r\n\r\n- NGAY sau khi đăng ký, thí sinh sẽ nhận được email xác nhận tự động từ nhà trường. Quá trình đăng ký chỉ hoàn tất khi thí sinh nhận được email này. Trường hợp KHÔNG nhận được email xác nhận, thí sinh kiểm tra trong mục Spam (Thư rác).\r\n\r\n- Thí sinh chịu hoàn toàn trách nhiệm trước các thông tin đã nhập trên hệ thống đăng ký. Trường hợp có sai sót trong quá trình hậu kiểm, nhà trường sẽ trả hồ sơ và từ chối cho thí sinh nhập học.\r\n\r\n2) Thí sinh đọc kỹ Thông báo trước khi đăng ký: tại đây\r\n\r\n3) Công bố danh sách đủ điều kiện điểm: dự kiến ngày 15/07/2021 tại website tuyensinh.ou.edu.vn.',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:15:56',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-Dự kiến công bố kết quả sơ tuyển.png'),(17,'Thông báo ĐIỂM và DANH SÁCH TRÚNG TUYỂN ĐHCQ (phương thức kết quả THI TỐT NGHIỆP THPT 2020)','HĐTS trường Đại học Mở Thành phố Hồ Chí Minh\r\n\r\nCông bố điểm trúng tuyển Đợt 1 kỳ thi tuyển sinh Đại học CQ năm 2020\r\n\r\nphương thức sử dụng kết quả THI TỐT NGHIỆP THPT 2020 như sau: \r\n\r\nTrường hợp sinh viên có nguyện vọng rút hồ sơ, vui lòng liên hệ trực tiếp phòng Quản lý đào tạo (P.005, cơ sở Võ Văn Tần) đến hết ngày 30/10/2020\r\n\r\n1. Thí sinh tra cứu kết quả: <ở đây>\r\n\r\n2. Thí sinh xem hướng dẫn nhập học: <ở đây>\r\n\r\n3. Điểm chuẩn trúng tuyển Đợt 1 cụ thể như sau:\r\n\r\n- Điểm chuẩn được quy về hệ điểm 30. Điểm xét tuyển được làm tròn đến 02 chữ số thập phân.\r\n\r\n\r\n- Điểm xét tuyển được xác định như sau (làm tròn đến 02 chữ số thập phân): \r\n\r\nĐiểm xét tuyển = [(ĐM1*HS môn 1+ ĐM2*HS môn 2 + ĐM3 * HS môn 3)*3]/(Tổng hệ số) + Điểm ưu tiên Khu vực + Điểm ưu tiên đối tượng',1,1,NULL,_binary '',NULL,NULL,'2023-05-01 11:16:23',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-thanhtoantructuyen.jpg'),(18,'Thông báo tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp cao đẳng - hình thức đào tạo chính quy 2022','THÔNG BÁO\r\nVề việc không tổ chức mở lớp tuyển sinh đại học chính quy năm 2022\r\nĐại học bằng thứ 2 - Liên thông Cao đẳng lên Đại học\r\n\r\n \r\n\r\nCăn cứ Thông tư số 08/2022/TT-BGDĐT ngày 06/6/2022 của Bộ trưởng Bộ GDĐT về việc ban hành Quy chế tuyển sinh đại học, tuyển sinh cao đẳng ngành Giáo dục Mầm non;\r\n\r\nCăn cứ Quyết định số 1793/QĐ-ĐHM ngày 12/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc ban hành Đề án tuyển sinh đại học năm 2022;\r\n\r\nCăn cứ Thông báo số 1232/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp đại học (đại học bằng thứ 2), hình thức đào tạo chính quy năm 2022;\r\n\r\nCăn cứ Thông báo số 1233/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh trình độ đại học với đối tượng tốt nghiệp cao đẳng (liên thông cao đẳng – đại học), hình thức đào tạo chính quy năm 2022;\r\n\r\nCăn cứ Kết luận của Hội đồng tuyển sinh đại học chính quy năm 2022 tại phiên họp ngày 11/10/2022.',1,2,NULL,_binary '',NULL,NULL,'2023-05-01 11:17:34',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-Untitled-2-01.png'),(19,'Hồ sơ Đại học Bằng thứ 2 và Liên thông CĐ-ĐH 2016','1. Hồ sơ Đại học bằng thứ 2:\r\n\r\n1.1 Hướng dẫn chuẩn bị Hồ sơ dự tuyển\r\n\r\n1.2 Phiếu đăng ký lớp ôn tập\r\n\r\n1.3 Hồ sơ đăng ký dự thi\r\n\r\n1.4 Phiếu đăng ký dự thi\r\n\r\n1.5 Giấy đăng ký miễn thi\r\n\r\n1.6 Biên lai nhận hồ sơ\r\n\r\n2. Hồ sơ Liên thông từ Cao đẳng lên Đại học:\r\n\r\n2.1 Hướng dẫn chuẩn bị Hồ sơ dự tuyển\r\n\r\n2.2 Phiếu đăng ký lớp ôn tập\r\n\r\n2.3 Hồ sơ đăng ký dự thi\r\n\r\n2.4 Phiếu đăng ký dự thi\r\n\r\n2.5 Biên lai nhận hồ sơ\r\n\r\n',1,2,NULL,_binary '',NULL,NULL,'2023-05-01 11:18:29',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-N.i.M-6869.jpg'),(20,'Thời khoá biểu lớp ôn thi đầu vào ĐH Bằng thứ 2 & Liên thông từ Đại học 2017 - ĐỢT 2',' THÔNG TIN TUYỂN SINH ĐH BẰNG THỨ 2 VÀ LIÊN THÔNG CĐ-ĐH\r\n\r\n\r\nHọc viên vui lòng tham khảo thời khoá biểu lớp ôn thi đầu vào ĐH Bằng thứ 2 & Liên thông từ Đại học 2017 - ĐỢT 2 theo tập tin đính kèm: tải ở đây',1,2,NULL,_binary '',NULL,NULL,'2023-05-01 11:19:28',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-2907-01.png'),(21,'TB thời gian và thủ tục nhập học cho sinh viên trúng tuyển ĐH Bằng thứ hai và Liên thông CĐ-ĐH 2017','1. Công bố kết quả xét tuyển\r\n\r\nTrường Đại học Mở Thành phố Hồ Chí Minh công bố kết quả trúng tuyển kỳ thi Liên thông từ CĐ lên ĐH và Đại học bằng thứ Hai, hệ chính quy năm  tại website (Điểm chuẩn trúng tuyển và danh sách thí sinh trúng tuyển): http://tuyensinh.ou.edu.vn/ (http://tuyensinh.ou.edu.vn/news/view/144-thong-bao-ket-qua-thi-ts-dai-hoc-bang-thu-2-va-lien-thong-cd-dh-2017)\r\n\r\n2. Thời gian và địa điểm nhập học và bổ sung các giấy tờ sau nếu còn thiếu khi làm thủ tục đăng ký dự thi:\r\n\r\n- Thời gian làm thủ tục nhập học tại Trường: các ngày 10 và 11 tháng 8 năm 2017 từ 16 giờ 00 đến 19 giờ 00.\r\n\r\n- Địa điểm tại: Hội trường 602, lầu 6, số 97 Võ Văn Tần, Phường 6, Quận 3, Tp.Hồ Chí Minh.\r\n\r\nVà bổ sung các giấy tờ sau nếu còn thiếu khi làm thủ tục đăng ký dự thi:\r\n\r\n·        02 bản sao bằng tốt nghiệp Cao đẳng (đối với hệ liên thông) hoặc Đại học (đối với hệ văn bằng 2).\r\n\r\n·        Bản chính và 01 bản sao bảng điểm Cao đẳng (đối với hệ liên thông)  hoặc Đại học (đối với hệ văn bằng 2).\r\n\r\n    (nhà trường sẽ trả lại bản chính sau khi đối chiếu)\r\n\r\n·       Bản sao giấy khai sinh.\r\n\r\n·       Giấy khám sức khỏe do phòng khám quận, huyện cấp.\r\n\r\n- Thời gian nhập học chính thức: ngày 25/09/2017.\r\n\r\nĐối với thí sinh đến Trường nhập học chậm sau ngày 15 ngày kể từ ngày làm thủ tục nhập học nếu không có lý do chính đáng coi như bỏ học.\r\n\r\nChỉ hoàn học phí trong vòng 1 tháng kể từ ngày làm thủ tục nhập học.',1,2,NULL,_binary '',NULL,NULL,'2023-05-01 11:20:14',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-N.I.M-8167.jpg'),(22,'Thông báo dời ngày thi ĐH Bằng thứ 2 và Liên thông ĐH Đợt 1/2019','THÔNG BÁO\r\n\r\nVề việc dời ngày thi tuyển sinh\r\n\r\nĐại học bằng thứ hai và Liên thông CĐ lên ĐH hệ chính quy đợt 1 năm 2019\r\n\r\nTrường Đại học Mở Thành phố Hồ Chí Minh thông báo về việc dời ngày thi tuyển sinh đầu vào Đại học bằng thứ hai và liên thông Cao đẳng lên Đại học Chính quy năm 2019 đợt 1 như sau:\r\n\r\nTheo thông báo tuyển sinh Đại học Bằng thứ 2 và Liên thông từ Cao đẳng lên Đại học hệ chính quy 2019 đã công bố, kỳ thi tuyển sinh Đợt 1 năm 2019 sẽ được tổ chức vào chiều ngày 06 và ngày 07 tháng 7 năm 2019. Tuy nhiên, vì lý do khách quan, kỳ thi sẽ được nhà trường chuyển sang tổ chức thi vào chiều ngày 24 và ngày 25 tháng 8 năm 2019.\r\n\r\nĐồng thời, tuyển sinh Đại học bằng thứ hai và Liên thông CĐ-ĐH hệ chính quy đợt 1 và 2 sẽ được tổ chức thi chung vào 02 ngày này (ngày 24 và 25 tháng 8 năm 2019).\r\n\r\n- Thời gian công bố kết quả (dự kiến): 04/9.\r\n\r\n- Thời gian làm thủ tục nhập học:10 – 11/9.\r\n\r\n- Ngày nhập học dự kiến vẫn không thay đổi: 23/9/2019.\r\n\r\nMọi thông tin vui lòng liên hệ: Phòng Quản lý đào tạo, tầng trệt cơ sở 97 Võ Văn Tần, P.6, Q.3, thành phố Hồ Chí Minh; số điện thoại: (028) 3920 7627, email: tuyensinh@ou.edu.vn.',1,2,NULL,_binary '',NULL,NULL,'2023-05-01 11:22:19',NULL,'https://tuyensinh.ou.edu.vn/tmp/rscache/350x183-Thong tin nhap hoc-01.png'),(30,'Thông báo lịch tuần sinh hoạt công dân năm học 2022 - 2023','Phòng Công tác sinh viên thông báo lịch tuần sinh hoạt công dân năm học 2022 - 2023 - có edit\r\n\r\n    Thực hiện hướng dẫn của Bộ Giáo dục và Đào tạo về việc tổ chức \"Tuần sinh hoạt công dân - SV\" đầu năm học cho sinh viên năm học 2022 - 2023;\r\n\r\n    Căn cứ kế hoạch số 879/KH-ĐHM ngày 28/8/2014 về việc tổ chức \"Tuần sinh hoạt công dân - SV\" năm học 2022 - 2023, Phòng Công tác sinh viên thông báo lịch sinh hoạt công dân cụ thể như sau:\r\n\r\n- Lịch tuần sinh hoạt công dân năm học 2022 - 2023 dành cho sinh viên các khoá 2020 trở về trước (thời gian thực hiện từ 15/9/2022 đến 10/10/2022);\r\n\r\n- Lịch tuần sinh hoạt công dân năm học2022 - 2023 dành cho tân sinh viên các khoá 2021 (thời gian thực hiện từ 6/10/2014 đến 17/10/2023).\r\n\r\nĐề nghị toàn thể sinh viên quan tâm thực hiệ',1,1,NULL,_binary '',NULL,NULL,'2023-05-03 14:33:45',NULL,NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `answer` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `noti_id` int DEFAULT NULL,
  `isAnswer` bit(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `question_ibfk_2_idx` (`noti_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`noti_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Năm nay thí sinh muốn đăng ký xét tuyển vào học tại trường Đại học Mở TP.HCM thì điều kiện đăng ký xét tuyển như thế nào?',2,NULL,12,NULL,'2023-04-30 16:16:00'),(2,'Thời gian đăng ký xét tuyển, nhập học của Trường như thế nào?',3,NULL,12,NULL,'2023-04-30 16:42:31'),(3,'Trường Đại học Mở Thành phố Hồ Chí Minh là trường Đại học Công lập, Bán công lập hay Dân lập?',2,NULL,14,NULL,'2023-05-01 07:22:57'),(4,'Trường có ký túc xá (KTX) không?',3,NULL,14,NULL,'2023-05-01 10:06:49'),(6,'Điểm mạnh của Trường Đại học Mở Tp. HCM là gì?',11,NULL,14,NULL,'2023-05-01 10:45:22'),(8,'Học phí học tại Trường ĐH Mở Tp. HCM là bao nhiêu?',2,NULL,14,NULL,'2023-05-01 11:23:27'),(9,'Sinh viên thuộc diện gia đình chính sách, con thương binh liệt sĩ có được giảm học phí?',3,NULL,14,NULL,'2023-05-01 11:32:28'),(10,'Ngành nào dễ có việc làm ngay khi tốt nghiệp?',2,NULL,18,NULL,'2023-05-03 09:35:56');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_ibfk_1_idx` (`user_id`),
  KEY `comment_ibfk_2_idx` (`post_id`),
  KEY `comment_ibfk_3_idx` (`parent_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `reply_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'cảm ơn',1,17,'2023-05-03 10:15:01',1),(3,'Cảm ơn ạ',2,17,'2023-05-03 11:36:18',8),(4,'ghgh',3,30,'2023-05-03 21:17:23',9);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `score` float DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `major_id` (`major_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,2018,14,20.4,'','2023-04-27 12:35:31'),(2,2018,15,19,'','2023-04-27 12:37:49'),(3,2018,16,19.85,'','2023-04-27 12:38:05'),(4,2018,17,0,'','2023-04-27 12:38:24'),(5,2018,18,19.65,'','2023-04-27 12:38:42'),(6,2018,19,0,'','2023-04-27 12:39:05'),(7,2018,20,0,'','2023-04-27 12:39:26'),(8,2018,24,18.7,'','2023-04-27 12:40:16'),(9,2018,25,0,'','2023-04-27 12:40:31'),(10,2018,27,19.4,'','2023-04-27 12:40:53'),(11,2018,28,17.2,'','2023-04-27 12:41:14'),(12,2018,29,0,'','2023-04-27 12:41:44'),(13,2018,30,20.65,'','2023-04-27 12:42:07'),(14,2018,31,0,'','2023-04-27 12:42:25'),(15,2018,32,0,'','2023-04-27 12:42:35'),(16,2018,6,18,'','2023-04-27 12:42:59'),(17,2018,7,15.25,'','2023-04-27 12:43:29'),(18,2018,8,18.35,'','2023-04-27 12:43:55'),(19,2018,9,15.25,'','2023-04-27 12:44:27'),(20,2018,10,18.2,'','2023-04-27 12:44:40'),(21,2018,33,19.5,'','2023-04-27 12:45:16'),(22,2018,4,16.1,'','2023-04-27 12:45:36'),(23,2018,11,18.55,'','2023-04-27 12:45:58'),(24,2018,12,19.25,'','2023-04-27 12:46:27'),(25,2018,13,17,'','2023-04-27 12:46:45'),(26,2018,21,15,'','2023-04-27 12:47:06'),(27,2018,22,15,'','2023-04-27 12:47:28'),(28,2018,23,0,'','2023-04-27 12:47:45'),(29,2018,1,17,'','2023-04-27 12:48:00'),(30,2018,5,0,'','2023-04-27 12:48:14'),(31,2018,2,18.25,'','2023-04-27 12:48:30'),(32,2018,34,15,'','2023-04-27 12:48:51'),(33,2018,35,15,'','2023-04-27 12:49:05'),(34,2018,36,15,'','2023-04-27 12:49:48'),(35,2018,39,16.7,'','2023-04-27 12:50:06'),(36,2018,37,15,'','2023-04-27 12:50:21'),(37,2018,38,15,'','2023-04-27 12:50:46'),(38,2018,26,0,'','2023-04-27 12:51:25'),(39,2019,14,22.85,'','2023-04-27 13:11:57'),(40,2019,15,21.2,'','2023-04-27 14:10:51'),(41,2019,16,21.95,'','2023-04-27 14:11:52'),(42,2019,17,0,'','2023-04-27 14:12:08'),(43,2019,18,21.1,'','2023-04-27 14:12:23'),(44,2019,24,20.65,'','2023-04-27 14:12:52'),(45,2019,25,0,'','2023-04-27 14:13:07'),(46,2019,27,21.85,'','2023-04-27 14:14:02'),(47,2019,28,18.3,'','2023-04-27 14:14:20'),(48,2019,29,21.85,'','2023-04-27 14:14:50'),(49,2019,30,22.75,'','2023-04-27 14:15:15'),(50,2019,31,0,'','2023-04-27 14:15:50'),(51,2019,32,0,'','2023-04-27 14:16:04'),(52,2019,6,20.6,'','2023-04-27 14:16:21'),(53,2019,7,15.5,'','2023-04-27 14:16:34'),(54,2019,8,20.8,'','2023-04-27 14:16:48'),(55,2019,9,15.8,'','2023-04-27 14:17:03'),(56,2019,10,20,'','2023-04-27 14:17:19'),(57,2019,33,21.65,'','2023-04-27 14:17:38'),(58,2019,4,18.9,'','2023-04-27 14:18:57'),(59,2019,11,19.65,'','2023-04-27 14:19:15'),(60,2019,12,20.55,'','2023-04-27 14:19:29'),(61,2019,13,16,'','2023-04-27 14:19:46'),(62,2019,21,15,'','2023-04-27 14:20:05'),(63,2019,22,15,'','2023-04-27 14:20:19'),(64,2019,23,0,'','2023-04-27 14:20:35'),(65,2019,1,19.2,'','2023-04-27 14:20:56'),(66,2019,5,0,'','2023-04-27 14:21:10'),(67,2019,2,20.85,'','2023-04-27 14:21:27'),(68,2019,34,15.5,'','2023-04-27 14:21:46'),(69,2019,35,15.3,'','2023-04-27 14:22:01'),(70,2017,36,15.5,'','2023-04-27 14:22:16'),(71,2019,39,18.2,'','2023-04-27 14:22:35'),(72,2019,37,15.5,'','2023-04-27 14:22:51'),(73,2019,38,15.5,'','2023-04-27 14:23:05'),(74,2019,19,0,'','2023-04-27 14:23:27'),(75,2019,20,0,'','2023-04-27 14:23:35'),(76,2019,26,0,'','2023-04-27 14:23:51'),(77,2020,14,24.75,'','2023-04-27 14:25:11'),(78,2020,15,23.25,'','2023-04-27 14:25:23'),(79,2020,16,24.25,'','2023-04-27 14:25:37'),(80,2020,17,0,'','2023-04-27 14:25:45'),(81,2020,18,23.75,'','2023-04-27 14:26:01'),(82,2020,24,24.1,'','2023-04-27 14:26:23'),(83,2020,25,0,'','2023-04-27 14:26:38'),(84,2020,27,24.7,'','2023-04-27 14:26:59'),(85,2020,28,21.65,'','2023-04-27 14:27:16'),(86,2020,29,25.35,'','2023-04-27 14:27:34'),(87,2020,30,25.05,'','2023-04-27 14:27:54'),(88,2020,31,24.35,'','2023-04-27 14:28:15'),(89,2020,32,22,'','2023-04-27 14:28:34'),(90,2020,6,24,'','2023-04-27 14:28:47'),(91,2020,7,18.5,'','2023-04-27 14:29:01'),(92,2020,8,24,'','2023-04-27 14:29:13'),(93,2020,9,16.5,'','2023-04-27 14:29:26'),(94,2020,10,23.8,'','2023-04-27 14:29:43'),(95,2020,33,23.05,'','2023-04-27 14:30:01'),(96,2020,4,23.2,'','2023-04-27 14:30:16'),(97,2020,11,22.8,'','2023-04-27 14:30:29'),(98,2020,12,23.55,'','2023-04-27 14:30:49'),(99,2020,13,19.2,'','2023-04-27 14:31:11'),(100,2020,21,16,'','2023-04-27 14:31:28'),(101,2020,22,16,'','2023-04-27 14:31:47'),(102,2020,23,0,'','2023-04-27 14:32:03'),(103,2020,5,0,'','2023-04-27 14:33:07'),(104,2020,1,23,NULL,'2023-04-27 14:33:30'),(105,2020,2,24.5,'','2023-04-27 14:33:56'),(106,2020,34,16,'','2023-04-27 14:34:13'),(107,2020,35,16,'','2023-04-27 14:34:27'),(108,2020,36,16,'','2023-04-27 14:34:55'),(109,2020,39,21.75,'','2023-04-27 14:35:10'),(110,2020,37,19.5,'','2023-04-27 14:35:26'),(111,2020,38,16,'','2023-04-27 14:35:44'),(112,2017,19,0,'','2023-04-27 14:35:54'),(113,2020,20,0,'','2023-04-27 14:36:03'),(114,2020,26,0,'','2023-04-27 14:36:17'),(115,2021,14,26.8,'','2023-04-27 14:36:37'),(116,2022,14,24.9,'','2023-04-27 14:36:50'),(117,2021,15,25.9,'','2023-04-27 14:37:06'),(118,2022,15,22.4,'','2023-04-27 14:37:20'),(119,2021,16,26.1,'','2023-04-27 14:37:36'),(120,2022,16,24.1,'','2023-04-27 14:37:55'),(121,2021,17,25.75,'','2023-04-27 14:38:15'),(122,2022,17,22.5,'','2023-04-27 14:38:24'),(123,2021,18,25.9,'','2023-04-27 14:38:41'),(124,2022,18,23.2,'','2023-04-27 14:38:58'),(125,2021,24,25.8,'','2023-04-27 14:39:16'),(126,2022,24,23.4,'','2023-04-27 14:39:26'),(127,2021,25,0,'','2023-04-27 14:39:44'),(128,2022,25,19,'','2023-04-27 14:39:55'),(129,2021,27,26.4,'','2023-04-27 14:40:21'),(130,2022,27,23.3,'','2023-04-27 14:52:47'),(131,2021,28,26.4,'','2023-04-27 14:53:04'),(132,2022,28,20,'','2023-04-27 14:53:20'),(133,2021,29,26.95,'','2023-04-27 14:53:36'),(134,2022,29,25.25,'','2023-04-27 14:54:04'),(135,2021,30,26.45,'','2023-04-27 14:54:22'),(136,2022,30,24.7,'','2023-04-27 14:54:58'),(137,2021,31,26.8,'','2023-04-27 14:55:15'),(138,2022,31,25.2,'','2023-04-27 14:55:32'),(139,2021,32,24.5,'','2023-04-27 14:55:48'),(140,2022,32,23.8,'','2023-04-27 14:56:05'),(141,2021,6,25.85,'','2023-04-27 14:56:19'),(142,2022,7,23.6,'','2023-04-27 14:56:42'),(143,2021,8,25.7,'','2023-04-27 14:56:57'),(145,2021,9,24.15,'','2023-04-27 14:57:23'),(146,2022,9,21.5,'','2023-04-27 14:57:45'),(147,2021,10,25.2,'','2023-04-27 14:58:04'),(148,2022,10,24.25,'','2023-04-27 14:58:16'),(149,2021,33,26.25,'','2023-04-27 14:58:40'),(150,2022,33,25,'','2023-04-27 14:58:53'),(151,2021,4,25.9,'','2023-04-27 14:59:12'),(152,2022,4,23.5,'','2023-04-27 14:59:23'),(153,2021,11,25.2,'','2023-04-27 14:59:45'),(154,2022,11,23.2,'','2023-04-27 14:59:59'),(155,2021,12,25.75,'','2023-04-27 15:00:15'),(156,2022,12,23.6,'','2023-04-27 15:00:29'),(157,2021,13,25.1,'','2023-04-27 15:00:42'),(158,2022,13,21.5,'','2023-04-27 15:00:55'),(159,2021,21,16,'','2023-04-27 15:01:17'),(160,2022,21,16,'','2023-04-27 15:01:29'),(161,2021,22,16,'','2023-04-27 15:01:45'),(162,2022,22,16,'','2023-04-27 15:01:57'),(163,2021,23,19,'','2023-04-27 15:02:15'),(164,2022,23,20.25,'','2023-04-27 15:02:26'),(165,2021,1,25.55,'','2023-04-27 15:02:43'),(166,2022,1,24.5,'','2023-04-27 15:02:57'),(167,2021,5,24,'','2023-04-27 15:03:12'),(168,2022,5,24.3,'','2023-04-27 15:03:22'),(169,2021,2,26.1,'','2023-04-27 15:03:56'),(170,2022,2,25.4,'','2023-04-27 15:04:14'),(171,2021,34,17,'','2023-04-27 15:04:34'),(172,2022,34,16,'','2023-04-27 15:04:49'),(173,2021,35,16,'','2023-04-27 15:05:05'),(174,2022,35,16,'','2023-04-27 15:05:16'),(175,2021,36,19,'','2023-04-27 15:05:33'),(176,2022,36,16,'','2023-04-27 15:05:51'),(177,2021,39,23.1,'','2023-04-27 15:06:07'),(178,2022,39,20,'','2023-04-27 15:06:20'),(179,2021,37,23.1,'','2023-04-27 15:06:40'),(180,2022,37,22,'','2023-04-27 15:06:54'),(181,2021,38,18.8,'','2023-04-27 15:07:10'),(182,2022,38,20,'','2023-04-27 15:07:22'),(183,2021,19,24.9,'','2023-04-27 15:07:46'),(184,2022,19,23,'','2023-04-27 15:08:03'),(185,2021,20,26.7,'','2023-04-27 15:09:56'),(186,2022,20,24.3,'','2023-04-27 15:10:14'),(187,2021,26,0,'','2023-04-27 15:10:35'),(188,2022,26,16,'','2023-04-27 15:10:48'),(189,2021,7,25.25,'','2023-04-27 16:45:24'),(190,2022,6,23.6,'','2023-04-27 16:47:36'),(194,2022,8,23.3,'','2023-04-28 18:53:58');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `passWord` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin01','$2a$10$slAMoWqFGodHbPojygNm0uSdpFZIVDYtPNsvHOtj6NtndlfvvF9NS','1951052184tham@ou.edu.vn','https://res.cloudinary.com/dp50hyprx/image/upload/v1682915966/f1face431f54dd715719c44fdcbd75ce_bf0hpy.png','ROLE_ADMIN',_binary '','2023-04-29 10:05:26','Nguyễn Lê Hồng Thắm'),(2,'HongTham1402','$2a$10$.cDwa5Wtxhj5xUC2VN8RFO7jaw4CHmyKxy9SZUk6iVjUfCJ2OFFwi','minitham1402@gmail.com','https://res.cloudinary.com/dp50hyprx/image/upload/v1682846072/byvz4xtbtqi7t8ykfzms.png','ROLE_USER',_binary '','2023-04-30 16:14:33','Nguyễn Lê Hồng Thắm'),(3,'Yen010101','$2a$10$bnNRa3GqpIxixTJaI9YEc.2HlGeuVjxkfHT5BaX.ACmyqbjzhO12m','140201nguyenlehongtham@gmail.com','https://res.cloudinary.com/dp50hyprx/image/upload/v1682847119/aocg1lscxbwyome5gody.png','ROLE_USER',_binary '','2023-04-30 16:32:00','Nguyễn Thị Yến'),(11,'HoangAn0811','$2a$10$HuRdnbzTZQVrHlSQtW02YeG0xWz3vpmx9Qc6f6TVx5n0cGrB6WNIm','HoangAn@gmail.com','https://res.cloudinary.com/dp50hyprx/image/upload/v1682912433/ayogi7lc1uxbmfsccjkr.png','ROLE_USER',_binary '','2023-05-01 10:40:33','Nguyễn Lê Hoàng Ân');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-04 10:50:28
