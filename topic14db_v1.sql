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
  `content` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Đào tạo sau đại học','  Khoa Đào tạo sau đại học Trường Đại học Mở TPHCM là nơi tổ chức đào tạo các chương trình sau đại học trong nước và liên kết ở ba lĩnh vực chính: kinh tế-quản trị, kỹ thuật-công nghệ, và xã hội-nhân văn. Các giá trị cốt lõi của Trường như khuyến khích người học sáng tạo, không ngừng học hỏi để mở rộng tri thức, hội nhập quốc tế, gắn kết thực tiễn, phục vụ cộng đồng, linh hoạt và thân thiện đã định hình nên mọi hoạt động giảng dạy, học tập và nghiên cứu của Khoa Đào tạo sau đại học.','http://sdh.ou.edu.vn/','https://www.youtube.com/embed/da8douuv0-M','2023-04-24 14:30:18','2023-04-24 14:30:18','https://res.cloudinary.com/dp50hyprx/image/upload/v1682321419/ohy761anndx0uexongbd.png',_binary ''),(3,'Công nghệ thông tin','Khoa Công Nghệ Thông Tin (CNTT) được thành lập từ tháng 09/1990 và là một trong những Khoa được thành lập đầu tiên của trường Đại Học Mở Tp. Hồ Chí Minh. Trải qua hơn 30 năm xây dựng và phát triển, hiện nay Khoa có đội ngũ giảng viên cơ hữu giàu kinh nghiệm và tận tâm gồm các Tiến sĩ, Thạc sĩ tốt nghiệp từ các trường danh tiếng trong và ngoài nước cùng với các giảng viên thỉnh giảng đến từ các trường Đại học, viện nghiên cứu uy tín ở TP HCM. Khoa đã đào tạo và cung cấp nguồn nhân lực có chất lượng cho xã hội với số lượng xấp xỉ 5.500 cử nhân khoa học hệ chính quy khối ngành Công nghệ thông tin (Khoa học máy tính, Tin học, Hệ thống thông tin quản lý) và hàng ngàn cử nhân Tin học hệ không chính quy.\r\nKhoa đào tạo nhân lực cho ngành CNTT có đạo đức, có kiến thức lý thuyết tốt, có kỹ năng thực hành thành thạo, có khả năng nắm bắt được những vấn đề mới của sự phát triển ngành, phục vụ sự nghiệp công nghiệp hóa hiện đại hóa đất nước thông qua quá trình tin học hóa các lĩnh vực quản lý kinh tế, quản lý sản xuất, quản lý xã hội, giáo dục, …','http://it.ou.edu.vn/','https://www.youtube.com/embed/6F6RGmVvfdM','2023-04-24 14:40:44','2023-04-24 14:40:44','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322044/yvmohmizekyni6mrsxwf.png',_binary ''),(4,'Kinh tế và Quản lý công','Khoa Kinh tế và Quản lý công luôn tự hào là một trong những khoa lớn mạnh nhất trong quá trình phát triển ba mươi năm qua của Trường đại học Mở thành phố Hồ Chí Minh. Để đáp ứng nhu cầu đào tạo, Khoa Kinh tế được tách ra từ Khoa Kinh tế - Quản trị Kinh doanh vào năm 2007. Với đà phát triển không ngừng, đến năm 2010, Khoa Kinh tế lại tiếp tục được đổi tên thành Khoa Kinh tế và Luật để phù hợp với hai ngành đào tạo của Khoa là ngành Kinh tế và ngành Luật Kinh tế. Cùng với sự lớn mạnh liên tục thì vào tháng 10 năm 2015 Khoa Kinh tế và Luật lại được tách thành hai đơn vị đào tạo là Khoa Luật và Khoa Kinh tế và Quản lý công.\r\nKhoa Kinh tế và Quản lý công là một trong những đơn vị đào tạo chủ lực của Trường đại học Mở thành phố Hồ Chí Minh với đa dạng cấp học từ cử nhân, thạc sĩ cho đến tiến sĩ. Khoa kinh tế và Quản lý công đã thực hiện đào tạo ngành Kinh tế ở cấp độ Đại học với bề dày từ năm 2006. Nhằm phát triển tối đa  năng lực của người học cũng như đáp ứng nhu cầu đa dạng của thị trường lao động, sau \r\n\r\ngiai đoạn học tập các môn học mang tính nền tảng thì sinh viên được tự do lựa chọn học tập chuyên sâu với bốn chuyên ngành: Kinh tế học, Kinh tế đầu tư, Kinh tế quốc tế và Quản lý công. Các chương trình đào tạo của Khoa luôn được thiết kế với quan điểm linh hoạt, chú trọng đổi mới phương pháp giảng dạy theo hướng: giảm khối lượng lý thuyết, tăng thời gian thảo luận và tự học theo phương châm lấy người học làm trung tâm của quá trình giảng dạy.','http://v1.ou.edu.vn/ktqlc/Pages/default.aspx','https://www.youtube.com/embed/hb1n9SwwzEk','2023-04-24 14:47:59','2023-04-24 14:47:59','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322478/nn8gafoeceflzlne5elz.png',_binary ''),(5,'Tài chính - Ngân hàng','Sự phát triển của hệ thống ngân hàng, các định chế tài chính phi ngân hàng và các công ty chứng khoán tạo nên những mảng màu tươi mới cho bức tranh kinh tế Việt Nam. Tuyển dụng nhân lực có chất lượng làm việc trong lĩnh vực tài chính – ngân hàng - chứng khoán là nhu cầu tất yếu của các doanh nghiệp trong ngành. Khoa Kế toán - Tài chính - Ngân hàng, được thành lập và thực hiện hoạt động đào tạo từ năm 2005, tách ngành Kế toán và đổi tên thành Khoa Tài chính - Ngân hàng từ năm 2009 với mục tiêu đào tạo nguồn nhân lực chất lượng cao nắm vững kiến thức kinh tế xã hội cơ bản, kiến thức chuyên sâu về ngành và chuyên ngành đủ đáp ứng nhu cầu sử dụng của các doanh nghiệp lĩnh vực tài chính – ngân hàng – chứng khoán. Khoa Tài chính - Ngân hàng thực hiện nhiệm vụ đào tạo 3 chuyên ngành: Tài chính doanh nghiệp, Đầu tư tài chính và Ngân hàng với các hệ đào tạo: Đại học chính quy tập trung, Văn bằng 2, Từ xa và Vừa làm vừa học. Chúng tôi luôn coi trọng chất lượng đào tạo, nỗ lực đổi mới chương trình đào tạo theo hướng hiện đại, áp dụng phương pháp giảng dạy lấy sinh viên là trung tâm của hoạt động giảng dạy, học tập.','http://tcnh.ou.edu.vn/','https://www.youtube.com/embed/zn2iY3zjULQ','2023-04-24 14:52:47','2023-04-24 14:52:47','https://res.cloudinary.com/dp50hyprx/image/upload/v1682322767/m3tbee6btylbonzsdmrc.png',_binary ''),(6,'Đào tạo đặc biệt','Khoa Đào tạo đặc biệt (ĐTĐB) tiền thân là “Chương trình Đào tạo đặc biệt” được thành lập vào năm 2006, đào tạo chất lượng cao, nhằm cung cấp dịch vụ đào tạo đại học chất lượng, phương pháp đào tạo tiên tiến, chương trình đào tạo phù hợp với nhu cầu của xã hội và hội nhập với chương trình đào tạo của các trường đại học quốc tế.\r\nNgày 09 tháng 03 năm 2016, Bộ Giáo dục và Đào tạo xác nhận đề án đào tạo chất lượng cao trình độ đại học các ngành Quản trị kinh doanh, Tài chính- Ngân hàng, Kế toán, Luật kinh tế, Ngôn ngữ Anh của trường Đại học Mở Tp. Hồ Chí Minh đã đảm bảo đủ các tiêu chí và điều kiện quy định về đào tạo chất lượng cao trình độ đại học. Sau hơn 10 năm triển khai và hoạt động, Khoa ĐTĐB đã gặt hái nhiều thành công và cung cấp nguồn nhân lực chất lượng cao cho các doanh nghiệp và các tổ chức tài chính.','http://v1.ou.edu.vn/dacbiet/Pages/default.aspx','https://www.youtube.com/embed/P1qCo_QGMSo','2023-04-24 14:59:47','2023-04-24 14:59:47','https://res.cloudinary.com/dp50hyprx/image/upload/v1682323187/tpyi8lvcwebgdvucoqt1.jpg',_binary ''),(7,'Kế toán - Kiểm toán','Khoa Kế toán – Kiểm toán được thành lập năm 2010 trên cơ sở tách ra từ Khoa Kế toán – Tài chính – Ngân hàng, với mục đích tập trung vào phát triển đào tạo và nghiên cứu khoa học trong lĩnh vực kế toán – kiểm toán.\r\n\r\nKhoa Kế toán – Kiểm toán đào tạo và cung cấp nguồn nhân lực kế toán, tài chính, kiểm toán và tư vấn cho các doanh nghiệp sản xuất, kinh doanh, dịch vụ, các công ty kiểm toán và tư vấn cũng như các cơ quan hành chính sự nghiệp, phục vụ cho sự phát triển của nền kinh tế Việt Nam.','http://v1.ou.edu.vn/ktkt/Pages/default1.aspx','https://www.youtube.com/embed/1P2COG3oU2Y','2023-04-24 15:04:23','2023-04-24 15:04:23','https://res.cloudinary.com/dp50hyprx/image/upload/v1682323463/yk2w9qjuilocfdaejedo.jpg',_binary ''),(8,'Ngoại ngữ','Học tập là lấy người học làm trọng tâm chứ không phải là nhà Trường hay Giáo viên. Học tập là sự phối hợp và người học sẽ nhận được các lợi ích từ sự liên kết đào tạo giữa các cơ sở đào tạo bao gồm cả tài liệu giảng dạy và các chương trình liên kết. Học tập được xây dựng dựa trên nền tảng kiến thức và kỹ năng hiện hành. Học tập có thể thông qua giáo dục từ xa.','https://khoann.ou.edu.vn/','https://www.youtube.com/embed/lQSGkXcftJk','2023-04-24 15:37:15','2023-04-24 15:37:15','https://res.cloudinary.com/dp50hyprx/image/upload/v1682325435/yukyjxfjxxvz2xly0uph.png',_binary ''),(9,'Xây dựng','Khoa Xây Dựng - Trường ĐH Mở TP.HCM, được thành lập từ năm 1992. Tiền thân là Khoa Công thôn, Khoa Kỹ thuật Công nghệ và Khoa Xây dựng - Điện. Đến năm 2018 chính thức có tên là Khoa Xây Dựng. Hiện tại, Có 31 viên chức với 1100 SV chính quy, 300 SV hệ từ xa - VHVL, 60 HV Cao học và 2 nghiên cứu sinh đang theo học. Khoa hiện đang vận hành nhiều chương trình đào tạo liên quan đến ngành Kỹ thuật xây dựng và Quản lý xây dựng cho bậc đại học, thạc sĩ và tiến sĩ.','http://ce.ou.edu.vn/','https://www.youtube.com/embed/BKKZxsRYGyc','2023-04-24 15:40:39','2023-04-24 15:40:39','https://res.cloudinary.com/dp50hyprx/image/upload/v1682325639/ws8vix44pqjym5bmkdmm.png',_binary ''),(10,'Công nghệ sinh học','Được thành lập từ tháng 6 năm 1991, đầu tiên được đặt tên là “Ban Kỹ thuật sinh học”. Năm 1993, Trường có quyết định đổi tên thành “Khoa Công nghệ sinh học”, là Trường đầu tiên tại Việt Nam được Bộ Giáo dục và Đào tạo cho phép đào tạo ngành Công nghệ sinh học.\r\nTrong suốt quá trình hình thành, xây dựng và phát triển, Khoa luôn cải tiến chương trình đào tạo nhằm đáp ứng kịp yêu cầu của xã hội. Hiện nay, Khoa đang triển khai đào tạo bậc đại học Công nghệ Sinh học hệ đại trà, chất lượng cao, đào tạo từ xa với 3 chuyên ngành chính Công nghệ Sinh học Y dược, Công nghệ Sinh học Nông nghiệp - Môi trường, Công nghệ Thực phẩm. Bên cạnh đó, Khoa đã tổ chức đào tạo bậc Thạc sĩ Ngành Công nghệ Sinh học từ năm 2018.\r\n\r\n','http://v1.ou.edu.vn/cnsh/Pages/defaultnew.aspx','https://www.youtube.com/embed/O48PF8gKe6w','2023-04-24 15:44:28','2023-04-24 15:44:28','https://res.cloudinary.com/dp50hyprx/image/upload/v1682325869/pwvsttiiipgbrczfnhls.bmp',_binary ''),(11,'Luật','Khoa Luật được thành lập theo Quyết định 1328/QĐ-ĐHM ngày 09 tháng 10 năm 2015 của Hiệu trưởng Trường Đại học Mở Thành phố Hồ Chí Minh trên cơ sở tách ra từ Khoa Kinh tế và Luật (được thành lập vào năm 2009).\r\nKhoa Luật đào tạo hai ngành: ngành Luật và ngành Luật Kinh tế với mục tiêu đào tạo cử nhân Luật và cử nhân Luật Kinh tế có trình độ vững vàng về kiến thức luật học và kiến thức bổ trợ khác để có thể thích ứng với tất cả các công việc liên quan đến pháp lý, đồng thời được chuyên sâu theo lựa chọn các chuyên ngành: chuyên ngành pháp luật thương mại, chuyên ngành pháp luật dân sự, chuyên ngành pháp luật hành chính. Bên cạnh đó, Khoa chú trọng rèn luyện các kỹ năng chuyên môn và các kỹ năng mềm, hình thành thái độ đúng đắn đối với nghề nghiệp, cộng đồng, xã hội.','http://khoaluat.ou.edu.vn/','https://www.youtube.com/embed/qWTrVBq2gwE','2023-04-24 15:48:19','2023-04-24 15:48:19','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326098/uybkw0vb6mbnpmsuaqoy.png',_binary ''),(12,'Quản trị kinh doanh','Khoa Quản trị Kinh doanh hiện có khoảng 3.000 sinh viên theo học hệ đào tạo chính quy tập trung và hơn 5.000 sinh viên đang theo học hệ từ xa (truyền thống và trực tuyến) và vừa làm - vừa học. Những năm qua, Khoa Quản trị Kinh doanh không ngừng nỗ lực cải tiến nội dung giảng dạy, biên soạn giáo trình, tài liệu học tập, áp dụng nhiều phương pháp giảng dạy tiên tiến. Ngoài ra, sinh viên còn được tạo điều kiện rèn luyện kỹ năng, gắn kết thực tế qua việc tham gia các chương trình học thuật, tham quan doanh nghiệp và nhiều hoạt động câu lạc bộ, đội nhóm phong phú do Khoa tổ chức.','http://kqtkd.ou.edu.vn/','https://www.youtube.com/embed/YwvPJXQmdzI','2023-04-24 15:52:37','2023-04-24 15:52:37','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326359/vdgiotxshoncof6q62kx.png',_binary ''),(13,'XHH - CTXH - ĐNA','Năm 1991, khoa Đông Nam Á học đào tạo ngành Đông Nam Á học với mục tiêu đào tạo về khu vực học, cung cấp kiến thức về các lĩnh vực của khu vực Đông Nam Á. Năm 1992, khoa Phụ nữ học đào tạo ngành Xã hội học nhằm trang bị kiến thức, giúp sinh viên nắm vững phương pháp nghiên cứu xã hội và nhận diện, phân tích các vấn đề xã hội. Năm 2003, khoa Phụ nữ học đổi tên thành khoa Xã hội học. Đến năm 2004, khoa Xã hội học mở ngành đào tạo Công tác xã hội. Năm 2010, khoa Xã hội học đổi tên thành khoa Xã hội học và Công tác xã hội. Năm 2011, khoa chính thức mang tên gọi khoa Xã hội học – Công tác xã hội – Đông Nam Á.','http://xhh.ou.edu.vn/','https://www.youtube.com/embed/Uko2vJ11mdE','2023-04-24 15:58:56','2023-04-24 15:58:56','https://res.cloudinary.com/dp50hyprx/image/upload/v1682326735/nhx07fqxd3bwgjyxgfcn.png',_binary ''),(14,'gggg','hhhhh','hghhh','','2023-04-24 19:27:36','2023-04-24 20:36:10','https://res.cloudinary.com/dp50hyprx/image/upload/v1682339257/y1m2ngxau8r5xagsn2ar.jpg',_binary '\0'),(15,'ffff12345','fffff333','ffff444','','2023-04-24 19:39:01','2023-04-29 07:11:40','https://res.cloudinary.com/dp50hyprx/image/upload/v1682339941/ezqrftppgcyxotrhfsvr.jpg',_binary '\0'),(16,'Công nghệ thực phẩm','tttt','tttt','','2023-04-25 14:17:39','2023-04-25 14:18:21','https://res.cloudinary.com/dp50hyprx/image/upload/v1682407062/u4nfrzm3bjlw7hhb0b5f.png',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (1,3,'7480101','Khoa học máy tính'),(2,3,'7480201','Công nghệ thông tin'),(3,3,'7480201','Công nghệ thông tin tăng cường tiếng nhật'),(4,3,'7340405','Hệ thống thông tin quản lý'),(5,6,'7480101C','Khoa học máy tính (Chất lượng cao)'),(6,5,'7340201','Tài chính - Ngân hàng'),(7,6,'7340201C','Tài chính - Ngân hàng (Chất lượng cao)'),(8,7,'7340301','Kế toán'),(9,6,'7340301C','Kế toán (Chất lượng cao)'),(10,7,'7340302','Kiểm toán'),(11,11,'7380101','Luật'),(12,11,'7380107','Luật kinh tế'),(13,6,'7380107C','Luật kinh tế (Chất lượng cao)'),(14,8,'7220201','Ngôn ngữ Anh'),(15,6,'7220201C','Ngôn ngữ Anh (Chất lượng cao)'),(16,8,'7220204','Ngôn ngữ Trung'),(17,6,'7220204C','Ngôn ngữ Trung (Chất lượng cao)'),(18,8,'7220209','Ngôn ngữ Nhật'),(19,6,'7220209C','Ngôn ngữ Nhật (Chất lượng cao)'),(20,8,'7220210','Ngôn ngữ Hàn'),(21,10,'7420201','Công nghệ sinh học'),(22,6,'7420201C','Công nghệ sinh học (Chất lượng cao)'),(23,10,'7540101','Công nghệ thực phẩm'),(24,4,'7310101','Kinh tế'),(25,6,'7310101C','Kinh tế (Chất lượng cao)'),(26,4,'7340403','Quản lý công'),(27,12,'7340101','Quản trị kinh doanh'),(28,6,'7340101C','Quản trị kinh doanh (Chất lượng cao)'),(29,12,'7340115','Marketing'),(30,12,'7340120','Kinh doanh quốc tế'),(31,12,'7510605','Logistics và Quản lý chuỗi cung ứng'),(32,12,'7810101','Du lịch'),(33,12,'7340404','Quản trị nhân lực'),(34,9,'7510102','Công nghệ kỹ thuật công trình xây dựng'),(35,6,'7510102C','Công nghệ kỹ thuật công trình xây dựng (Chất lượng cao)'),(36,9,'7580302','Quản lý xây dựng'),(37,13,'7310301','Xã hội học'),(38,13,'7760101','Công tác xã hội'),(39,13,'7310620','Đông Nam Á'),(47,16,'7480101','Công nghệ thực phẩm');
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
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_vi_0900_ai_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `isRead` bit(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_ibfk_1` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vi_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
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
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
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
  `passWord` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `isActive` bit(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2023-04-29  7:50:44
