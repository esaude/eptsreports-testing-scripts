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
-- WHERE:  form_id = 111

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (13,111,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Programa de Prevenção da Transmissão Vertical - PTV</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n		</style>\r\n</head>\r\n\r\n<body>\r\n<enrollInProgram programId=\"2\"/>\r\n<table width=\"100%\" border=\"1\">\r\n<tbody align=\"center\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td colspan=\"5\"><b>LIVRO DA CPN/PTV</b> <br/>\r\n      <strong>Dados pessoais da Utente (Grávida)</strong></td>\r\n    <td><div align=\"center\"><strong>Regime da ARV-NVP</strong></div></td>\r\n    <td colspan=\"2\"><div align=\"center\"><strong>Outros regimes de ARV</strong></div></td>\r\n    <td colspan=\"5\"><div align=\"center\"><strong>Data das seguintes consultas pré-natais (Indique a data da visita/CPN e a idade gestacional em semanas</strong>)</div></td>\r\n    </tr>\r\n  <tr>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Data de entrada na CPN/PTV</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Código</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Nome</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Idade (Anos)</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Idade gestacional (semanas)</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Data prevista de entrega da NVP a gravida</strong></div></td>\r\n    <td><div align=\"center\"><strong>TARV</strong></div></td>\r\n    <td><div align=\"center\"><strong>Profilaxia com (AZT+NVP intraparto)</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>2ª Visita</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>3ª Visita</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>4ª Visita</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>5ª Visita</strong></div></td>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>6ª Visita</strong></div></td>\r\n    </tr>\r\n  <tr>\r\n    <td><div align=\"center\"><strong>Data inicio TARV</strong></div></td>\r\n    <td><div align=\"center\"><strong>Data e idade gestacional (IG) inicio</strong></div></td>\r\n    </tr>\r\n  <tr>\r\n    <td rowspan=\"2\"><encounterDate/></td>\r\n    <td rowspan=\"2\"><lookup expression=\"patient.getPatientIdentifier(6)\"/></td>\r\n    <td rowspan=\"2\"><lookup expression=\"patient.personName\"/></td>\r\n    <td rowspan=\"2\"><lookup expression=\"patient.age\"/></td>\r\n    <td rowspan=\"2\"><obs conceptId=\"1279\" labelText=\"\"/></td>\r\n    <td rowspan=\"2\"><obs conceptId=\"1802\" labelText=\"\" allowFutureDates=\"true\"/></td>\r\n    <td rowspan=\"2\"><obs conceptId=\"1190\" labelText=\"\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"1504\" answerConceptId=\"797\" labelText=\"\" answerLabel=\"\" dateLabel=\"D:\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"6133\" labelText=\"D:\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"6134\" labelText=\"D:\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"6135\" labelText=\"D:\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"6136\" labelText=\"D:\"/></td>\r\n    <td width=\"8%\"><obs conceptId=\"6137\" labelText=\"D:\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td><obs conceptId=\"1808\" labelText=\"IG\"/></td>\r\n    <td><obs conceptId=\"2127\" labelText=\"IG\"/></td>\r\n    <td><obs conceptId=\"2128\" labelText=\"IG\"/></td>\r\n    <td><obs conceptId=\"2129\" labelText=\"IG\"/></td>\r\n    <td><obs conceptId=\"2130\" labelText=\"IG\"/></td>\r\n    <td><obs conceptId=\"2131\" labelText=\"IG\"/></td>\r\n    </tr>\r\n  </tbody>\r\n</table>\r\n<br /><br />\r\n<table width=\"100%\" border=\"0\">\r\n<tbody align=\"center\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Recebe Cotrimoxazol (Prevenção)</strong></div></td>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>Prescrição de FANSIDAR</strong></div></td>\r\n    <td colspan=\"2\" rowspan=\"2\"><div align=\"center\"><strong>Entrega de Neverapina na CPN</strong></div></td>\r\n    <td colspan=\"2\" rowspan=\"2\"><div align=\"center\"><strong>Transferencia para (Indique a data da transferência)</strong></div></td>\r\n    <td rowspan=\"3\"><div align=\"center\"><strong>Observações</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>Indique a data (D) e a idade gestacional (IG)</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"center\"><strong>Indique data inicio profilaxia (CTX)</strong></div></td>\r\n    <td><div align=\"center\"><strong>1ª Dose</strong></div></td>\r\n    <td><div align=\"center\"><strong>2ª Dose</strong></div></td>\r\n    <td><div align=\"center\"><strong>3ª Dose</strong></div></td>\r\n    <td><div align=\"center\"><strong>Data da entrega da NVP</strong></div></td>\r\n    <td><div align=\"center\"><strong>Idade gestacional (em semanas)</strong></div></td>\r\n    <td><div align=\"center\"><strong>Hospital de Dia</strong></div></td>\r\n    <td><div align=\"center\"><strong>Consulta Média/TIO</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td rowspan=\"2\"><div align=\"center\">\r\n      <obs conceptId=\"6121\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"S,N\" style=\"radio\" dateLabel=\"Data:\"/>\r\n    </div></td>\r\n    <td width=\"10%\"><div align=\"center\">\r\n      <obs conceptId=\"6130\" labelText=\"D:\"/>\r\n    </div></td>\r\n    <td width=\"10%\"><div align=\"center\">\r\n      <obs conceptId=\"6131\" labelText=\"D:\"/>\r\n    </div></td>\r\n    <td width=\"10%\"><div align=\"center\">\r\n      <obs conceptId=\"6132\" labelText=\"D:\"/>\r\n    </div></td>\r\n    <td rowspan=\"2\"><div align=\"center\">\r\n      <obs conceptId=\"2092\" labelText=\"\"/>\r\n    </div></td>\r\n    <td rowspan=\"2\"><div align=\"center\">\r\n      <obs conceptId=\"1812\" labelText=\"IG\"/>\r\n    </div></td>\r\n    <td rowspan=\"2\" width=\"15%\"><repeat>\r\n						<template>\r\n                        	<obs conceptId=\"1272\" answerConceptId=\"1797\" labelText=\"\" answerLabel=\"\" dateLabel=\"Data:\"/><br/>\r\n						</template>\r\n						<render/>\r\n						<render/>\r\n                        <render/>\r\n					</repeat></td>\r\n    <td rowspan=\"2\" width=\"15%\"><repeat>\r\n						<template>\r\n                        	<obs conceptId=\"1272\" answerConceptId=\"1798\" labelText=\"\" answerLabel=\"\" dateLabel=\"Data:\"/><br/>\r\n						</template>\r\n						<render/>\r\n						<render/>\r\n                        <render/>\r\n					</repeat></td>\r\n    <td rowspan=\"2\"><div align=\"center\">\r\n      <obs conceptId=\"1799\" labelText=\"\" style=\"textarea\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"center\">\r\n      <obs conceptId=\"1809\" labelText=\"IG\"/>\r\n    </div></td>\r\n    <td><div align=\"center\">\r\n      <obs conceptId=\"1809\" labelText=\"IG\"/>\r\n    </div></td>\r\n    <td><div align=\"center\">\r\n      <obs conceptId=\"1809\" labelText=\"IG\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\">\r\n      <encounterLocation default=\"13\" order=\"13\"/>\r\n    </div></td>\r\n    <td colspan=\"3\"><div align=\"center\">\r\n      <encounterProvider role=\"Provider\"/>\r\n    </div></td>\r\n    <td colspan=\"3\"><div align=\"center\">\r\n      <submit submitLabel=\"Submeter\"/>\r\n    </div></td>\r\n  </tr>\r\n  </tbody>\r\n</table>\r\n\r\n</body>\r\n</html>\r\n\r\n</htmlform>',13,'2011-01-12 12:40:35',13,'2013-12-13 17:35:43',0,'bb0e5422-0a3b-4b9b-9601-c7d7349c13cd',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03  9:57:09