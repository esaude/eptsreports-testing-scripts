-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: metadata
-- ------------------------------------------------------
-- Server version	8.0.17

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

--
-- Dumping data for table `htmlformentry_html_form`
--
-- WHERE:  form_id = 129

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (31,129,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>LIVRO DE REGISTO TARV</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n		.style1 {\r\n	font-size: 14px;\r\n	font-weight: bold;\r\n}\r\n</style>\r\n</head>\r\n\r\n<body>\r\n\r\n<table width=\"800\" border=\"1\" align=\"center\">\r\n<tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\" class=\"style1\">LIVRO DE REGISTO TARV</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"20%\"><div align=\"right\">Nome:</div></td>\r\n    <td width=\"25%\"><div align=\"left\">\r\n      <lookup expression=\"patient.personName\"/>\r\n    </div></td>\r\n  </tr>\r\n  \r\n\r\n  <tr>\r\n    <td><div align=\"right\">NID:</div></td>\r\n    <td><div align=\"left\">\r\n      <lookup expression=\"patient.getPatientIdentifier(2)\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Data de Registo:</div></td>\r\n    <td><div align=\"left\">\r\n      <encounterDate/>\r\n    </div></td>\r\n  </tr>\r\n   <tr>\r\n    <td><div align=\"right\">Unidade Sanitaria:</div></td>\r\n    <td><div align=\"left\">\r\n      <encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Registado Por:</div></td>\r\n    <td><div align=\"left\">\r\n      \r\n<encounterProvider role=\"Provider\" type=\"autocomplete\"/>\r\n    </div></td>\r\n  </tr>\r\n \r\n  <tr>\r\n    <td><div align=\"right\">Numero do Livro de Registo:</div></td>\r\n    <td><div align=\"left\">\r\n      <obs conceptId=\"6264\" id=\"livro\" labelText=\"\" answerConceptIds=\"6261,6262\" answerLabels=\"LIVRO 1,LIVRO 2\" style=\"radio\" required=\"true\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Pagina de Registo:</div></td>\r\n    <td><div align=\"left\">\r\n      <obs conceptId=\"6266\" labelText=\"\" required=\"true\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Linha do Livro:</div></td>\r\n    <td><div align=\"left\">\r\n      <obs conceptId=\"6268\" labelText=\"\" required=\"true\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n\r\n\r\n</body>\r\n</html>\r\n\r\n</htmlform>',13,'2012-02-29 17:27:54',13,'2014-05-07 12:50:10',0,'204c4988-91b6-47c0-a8ec-25280f769b48',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `htmlformentry_html_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 10:21:15
