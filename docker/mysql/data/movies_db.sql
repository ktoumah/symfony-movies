-- MySQL dump 10.13  Distrib 8.4.0, for Linux (x86_64)
--
-- Host: localhost    Database: movies_db
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `movies_db`;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240702175720','2024-07-02 17:58:29',77),('DoctrineMigrations\\Version20240703084447','2024-07-03 08:45:14',92),('DoctrineMigrations\\Version20240703095253','2024-07-03 09:53:05',104),('DoctrineMigrations\\Version20240703101958','2024-07-03 10:20:10',167),('DoctrineMigrations\\Version20240703102704','2024-07-03 10:27:15',119),('DoctrineMigrations\\Version20240703103701','2024-07-03 10:37:11',95),('DoctrineMigrations\\Version20240703121814','2024-07-03 12:18:22',88);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_provider_id` int DEFAULT NULL,
  `original_language` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popularity` double DEFAULT NULL,
  `vote_average` double DEFAULT NULL,
  `vote_count` int DEFAULT NULL,
  `backdrop_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (2,'Beverly Hills Cop: Axel F','/zszRKfzjM5jltiq8rk6rasKVpUv.jpg',280180,'en',113.524,6.986,36,'/rrwt0u1rW685u9bJ9ougg5HJEHC.jpg','2024-07-02'),(3,'Furiosa: A Mad Max Saga','/iADOJ8Zymht2JPMoy3R7xceZprc.jpg',786892,'en',4806.719,7.715,1668,'/wNAhuOZ3Zf84jCIlrcI6JhgmY5q.jpg','2024-05-22'),(4,'Despicable Me 4','/wWba3TaojhK7NdycRhoQpsG0FaH.jpg',519182,'en',1122.126,8.4,72,'/fDmci71SMkfZM8RnCuXJVDPaSdE.jpg','2024-06-20'),(5,'The Watchers','/vZVEUPychdvZLrTNwWErr9xZFmu.jpg',1086747,'en',894.01,6.471,329,'/whnFKx0Y54Ktg6o2TiwbnQfXdZf.jpg','2024-06-06'),(6,'A Quiet Place: Day One','/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg',762441,'en',1017.19,7.021,210,'/bWg5fnzjZOtFwOz4cDHWHtvsTPU.jpg','2024-06-26'),(7,'Inside Out 2','/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg',1022789,'en',4502.62,7.71,1267,'/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg','2024-06-11'),(8,'Boneyard','/xkNK36hQv8SWiwiQoE7naRfP0zL.jpg',1114738,'en',29.901,6,8,'/uNTciMXpCQDg7gvgMsPCdnxo6Re.jpg','2024-07-05'),(9,'범죄도시 4','/r7LHM9MsPEipFCBPbsV6nHzSw3D.jpg',1017163,'ko',172.4,7.225,20,'/mO9oOVXM8tTlC11VFM4FBBNnL3f.jpg','2024-04-24'),(10,'A Family Affair','/l0CaVyqnTsWwNd4hWsrLNEk1Wjd.jpg',987686,'en',663.005,6.242,155,'/ngLxW9WqQAkTCBTcjOSt2Pnz5qZ.jpg','2024-06-27'),(11,'君たちはどう生きるか','/f4oZTcfGrVTXKTWg157AwikXqmP.jpg',508883,'ja',259.829,7.482,1360,'/75nSb1fbWooipwcSU5bUttiOriI.jpg','2023-07-14'),(12,'Monkey Man','/4lhR4L2vzzjl68P1zJyCH755Oz4.jpg',560016,'en',166.424,7.087,544,'/lA6KdSkCTxwzvqzPqxch997RabQ.jpg','2024-04-03'),(13,'Deadpool & Wolverine','/jbwYaoYWZwxtPP76AZnfYKQjCEB.jpg',533535,'en',321.851,0,0,'/A4JG9mkAjOQ3XNJy2oji1Jr224R.jpg','2024-07-24'),(14,'In a Violent Nature','/o5pcDZaA9Up0X612os34JNCRX6j.jpg',1214509,'en',148.231,5.782,39,'/h7V8yzSnPYkNEvAqmeYHcfJ6rbk.jpg','2024-05-31'),(15,'Godzilla x Kong: The New Empire','/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',823464,'en',1086.92,7.2,3000,'/jvPMJ2zM92jfXxVEFsqP1MMrLaO.jpg','2024-03-27'),(16,'Dune: Part Two','/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',693134,'en',467.767,8.168,4724,'/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg','2024-02-27'),(17,'MaXXXine','/49MhUSsD9hG36nFttYRzgedMlL0.jpg',1023922,'en',114.532,8.2,5,'/dapb1b0mQtGcxP4PYzNCjuN7gOr.jpg','2024-07-04'),(18,'Beverly Hills Cop','/eBJEvKkhQ0tUt1dBAcTEYW6kCle.jpg',90,'en',59.838,7.186,3904,'/tKi5HYDSuxP4I26fxyF2UVvAtLa.jpg','1984-12-05'),(19,'IF','/xbKFv4KF3sVYuWKllLlwWDmuZP7.jpg',639720,'en',670.602,7.395,519,'/nxxCPRGTzxUH8SFMrIsvMmdxHti.jpg','2024-05-08');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overview`
--

DROP TABLE IF EXISTS `overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overview` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E7C3D1BB8F93B6FC` (`movie_id`),
  CONSTRAINT `FK_E7C3D1BB8F93B6FC` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overview`
--

LOCK TABLES `overview` WRITE;
/*!40000 ALTER TABLE `overview` DISABLE KEYS */;
INSERT INTO `overview` VALUES (2,'After his daughter\'s life is threatened, wisecracking detective Axel Foley teams up with a new partner and some old pals to turn up the heat on a conspiracy.',2),(3,'As the world fell, young Furiosa is snatched from the Green Place of Many Mothers and falls into the hands of a great Biker Horde led by the Warlord Dementus. Sweeping through the Wasteland they come across the Citadel presided over by The Immortan Joe. While the two Tyrants war for dominance, Furiosa must survive many trials as she puts together the means to find her way home.',3),(4,'Gru and Lucy and their girls — Margo, Edith and Agnes — welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, and the family is forced to go on the run.',4),(5,'A young artist gets stranded in an extensive, immaculate forest in western Ireland, where, after finding shelter, she becomes trapped alongside three strangers, stalked by mysterious creatures each night.',5),(6,'As New York City is invaded by alien creatures who hunt by sound, a woman named Sam fights to survive.',6),(7,'Teenager Riley\'s mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.',7),(8,'After Police Chief Carter discovers the remains of eleven women, FBI Special Agent Petrovick is recruited to profile the serial killer responsible for the infamous \"boneyard\" killings. As the police force, narcotics agency, and FBI lock horns, a tangled web of intrigue turns everyone into a suspect.',8),(9,'\'Monster Cop\' Ma Seok-do investigates an illegal online gambling business led by a former STS Baek and an IT genius CEO Chang. Ma proposes an unexpected alliance to Jang and begins hunting down the criminals.',9),(10,'The only thing worse than being the assistant to a high-maintenance movie star who doesn\'t take you seriously? Finding out he\'s smitten with your mom.',10),(11,'While the Second World War rages, the teenage Mahito, haunted by his mother\'s tragic death, is relocated from Tokyo to the serene rural home of his new stepmother Natsuko, a woman who bears a striking resemblance to the boy\'s mother. As he tries to adjust, this strange new world grows even stranger following the appearance of a persistent gray heron, who perplexes and bedevils Mahito, dubbing him the \"long-awaited one.\"',11),(12,'Kid is an anonymous young man who ekes out a meager living in an underground fight club where, night after night, wearing a gorilla mask, he is beaten bloody by more popular fighters for cash. After years of suppressed rage, Kid discovers a way to infiltrate the enclave of the city’s sinister elite. As his childhood trauma boils over, his mysteriously scarred hands unleash an explosive campaign of retribution to settle the score with the men who took everything from him.',12),(13,'A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.',13),(14,'The enigmatic resurrection, rampage, and retribution of an undead monster in a remote wilderness unleashes an iconic new killer after a locket is removed from a collapsed fire tower that entombed its rotting corpse.',14),(15,'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',15),(16,'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.',16),(17,'In 1980s Hollywood, adult film star and aspiring actress Maxine Minx finally gets her big break. But as a mysterious killer stalks the starlets of Hollywood, a trail of blood threatens to reveal her sinister past.',17),(18,'Fast-talking, quick-thinking Detroit street cop Axel Foley has bent more than a few rules and regs in his time, but when his best friend is murdered, he heads to sunny Beverly Hills to work the case like only he can.',18),(19,'A young girl who goes through a difficult experience begins to see everyone\'s imaginary friends who have been left behind as their real-life friends have grown up.',19);
/*!40000 ALTER TABLE `overview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'karimtoumah@gmail.com','[\"ROLE_USER\"]','$2y$13$i00T15xOHCBbNvbWWEslwOpSJ8OyBFmWwT4oCxA6dkmJYecIb.l92');
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

-- Dump completed on 2024-07-04  0:48:58
