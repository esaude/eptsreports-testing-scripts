-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fgh
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `htmlformentry_html_form`
--
-- WHERE:  form_id = 146

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` (`form_id`,`name`,`xml_data`,`creator`,`date_created`,`changed_by`,`date_changed`,`retired`,`uuid`,`description`,`retired_by`,`date_retired`,`retire_reason`)
 VALUES (146,NULL,'<htmlform>\r\n	<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>TESTE DO CASO DO INDICE DO PACIENTE</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n		.style1 {\r\n	font-size: 14px;\r\n	font-weight: bold;\r\n}\r\n</style>\r\n</head>\r\n\r\n<body>\r\n\r\n<table width=\"800\" border=\"1\" align=\"center\">\r\n<tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\" class=\"style1\">TESTE DO CASO DO INDICE DO PACIENTE</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"20%\"><div align=\"right\">Nome:</div></td>\r\n    <td width=\"25%\"><div align=\"left\">\r\n      <lookup expression=\"patient.personName\"/>\r\n    </div></td>\r\n  </tr>\r\n  \r\n\r\n  <tr>\r\n    <td><div align=\"right\">NID:</div></td>\r\n    <td><div align=\"left\">\r\n      <lookup expression=\"patient.getPatientIdentifier(2)\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Data de consentimento:</div></td>\r\n    <td><div align=\"left\">\r\n      <encounterDate/>\r\n    </div></td>\r\n  </tr>  \r\n  <tr>\r\n    <td><div align=\"right\">Unidade Sanitaria:</div></td>\r\n    <td><div align=\"left\">\r\n      \r\n      <encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Conselheiro:</div></td>\r\n    <td><div align=\"left\">\r\n      <encounterProvider role=\"Provider\" type=\"autocomplete\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Consentimento para testar membros?</div></td>\r\n    <td><div align=\"left\">\r\n      <obs id=\"consentimento\" conceptId=\"21153\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Nao\" style=\"radio\" required=\"true\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Se sim, o local de teste preferido?</div></td>\r\n    <td><div align=\"left\">\r\n      <obs id=\"preferido\" conceptId=\"21155\" labelText=\"\" answerConceptIds=\"6403,21154\" answerLabels=\"Em Casa,Unidade Sanitária\" style=\"radio\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n\r\n\r\n</body>\r\n</html>\r\n\r\n</htmlform>',1,'2017-01-17 16:27:58',1,'2017-01-27 13:58:32',0,'bc0ee3a4-b55f-46a2-aea6-a73bacc1fbf3',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-11 12:12:49
