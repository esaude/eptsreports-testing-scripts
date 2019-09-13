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
-- WHERE:  form_id = 107

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (9,107,NULL,'									\r\n<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>PCR</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<table width=\"700\" border=\"1\" align=\"center\">\r\n<tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n    <tr>\r\n    <td colspan=\"2\"><div align=\"center\"><strong>REPÚBLICA DE MOÇAMBIQUE<br />\r\n      SERVIÇO NACIONAL DE SAÚDE<br />\r\n      <br />\r\n    </strong></div></td>\r\n    <td colspan=\"2\"><div align=\"center\"><strong>FSR<br /> \r\n\r\nFormulario solicitacao teste de PCR<br />\r\npara AND de HIV<br />\r\n      <br />\r\n    </strong></div></td>\r\n  </tr>\r\n  \r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"left\">No ordem:<br /> <obs conceptId=\"2042\" labelText=\"\"/></div></td>\r\n    <td colspan=\"2\"><div align=\"left\">Nº do Laboratorio PCR:<br /> <lookup expression=\"patient.getPatientIdentifier(10)\"/></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"4\"><div align=\"left\"><strong>I.  A preencher pelo posto de colheita</strong></div></td>    \r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"4\"><div align=\"left\">Informacao sobre o paciente</div></td>    \r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"left\">Nome:<br/><lookup expression=\"patient.personName\"/></div></td>\r\n    <td><div align=\"left\">Sexo:<br/><lookup expression=\"patient.gender\"/></div></td>\r\n    <td><div align=\"left\">Data Nascimento:<lookup expression=\"patient.birthdate\"/><br/>\r\n    Idade:<lookup expression=\"patient.age\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"left\">NID:<br/><lookup expression=\"patient.getPatientIdentifier(9)\"/></div></td>\r\n    <td><div align=\"left\">Unidade Sanitaria:<br/><encounterLocation default=\"13\" order=\"13\"/></div></td>\r\n    <td><div align=\"left\">Provincia:<br/><lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.countyProvince #end\"/>  </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"left\">Data de colheita:<br/><obs conceptId=\"1998\" labelText=\"\" /></div></td>\r\n    <td><div align=\"left\">Nome solicitante:<br/><encounterProvider role=\"Provider\"/></div></td>\r\n    <td><div align=\"left\">Nome da mae:<obs conceptId=\"1477\" labelText=\"\" /><br/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"4\"><div align=\"left\">Informacao clinica</div></td>    \r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\" rowspan=\"2\"><div align=\"left\">Proveniencia da Crianca:<br/> \r\n    <obs conceptId=\"1046\" labelText=\"\" answerConceptIds=\"1939,1872,844,1044\" answerLabels=\"PTV,CCR,HDD, Enf. Pediatria\" style=\"radio\"/></div>    </td>\r\n        <td colspan=\"1\"><div align=\"left\">Aleitamento materno em curso:<br/> <obs conceptId=\"1151\" labelText=\"\" answerConceptIds=\"5526,1152\" answerLabels=\"Sim,Nao\" style=\"radio\"/>\r\n</div></td>\r\n  </tr>\r\n  <tr>\r\n        <td colspan=\"2\"><div align=\"left\">Idade desmane:<obs conceptId=\"1510\" labelText=\"\"/>(meses)\r\n</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td  colspan=\"2\"><div align=\"left\">PTV Mae: <br/>  \r\n    	<obs conceptId=\"1504\" answerConceptId=\"631\" labelText=\"\" answerLabel=\"NVP\"/>   \r\n    	<obs conceptId=\"1504\" answerConceptId=\"797\" labelText=\"\" answerLabel=\"AZT\"/>    \r\n    	<obs conceptId=\"1504\" answerConceptId=\"628\" labelText=\"\" answerLabel=\"3TC\"/>  \r\n    	<obs conceptId=\"1504\" answerConceptId=\"1800\" labelText=\"\" answerLabel=\"TARV\"/>    \r\n    	<obs conceptId=\"1504\" answerConceptId=\"1107\" labelText=\"\" answerLabel=\"Não\"/></div>    </td>\r\n    <td><div align=\"left\"> <obs conceptId=\"1504\" labelText=\"Data inicio:\"/></div></td>\r\n    \r\n    <td><div align=\"left\">PTV Crianca:<br/>   \r\n    	<obs conceptId=\"1836\" answerConceptId=\"631\" labelText=\"\" answerLabel=\"NVP\"/>   \r\n    	<obs conceptId=\"1836\" answerConceptId=\"1801\" labelText=\"\" answerLabel=\"AZT\"/>     \r\n    	por <obs conceptId=\"1710\" labelText=\"\" />semanas\r\n        <obs conceptId=\"1836\" answerConceptId=\"1107\" labelText=\"\" answerLabel=\"Nao\"/>   </div>    </td>\r\n  </tr>\r\n     <tr>\r\n     <td colspan=\"1\"><div align=\"right\">Resultado</div></td>\r\n    <td colspan=\"3\"><obs conceptId=\"1030\" labelText=\"\" answerConceptIds=\"703,664,1138\" answerLabels=\"Positivo,Negativo,Indeterminado\" style=\"radio\" dateLabel=\"Data Resultado:\"/></td>\r\n  </tr>\r\n  <tr>\r\n      <td colspan=\"2\"><div align=\"right\"><obs conceptId=\"1999\" labelText=\"Data Chegada Resultado:\"/></div></td>\r\n    <td colspan=\"2\"><div align=\"left\"><obs conceptId=\"2133\" labelText=\"Data Entrega Resultado:\"/></div></td>\r\n     </tr>\r\n   <tr>\r\n      <td colspan=\"2\"><div align=\"right\">Responsavel do laboratorio de Referencia:</div>        <obs conceptId=\"2000\" labelText=\"\"/></td>\r\n    <td colspan=\"2\"><div align=\"left\">Data:<encounterDate/></div></td>\r\n    </tr>\r\n   <tr>\r\n    <td colspan=\"4\"><div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n  </tr>\r\n  </tbody>\r\n</table>\r\n</body>\r\n</html>\r\n\r\n\r\n\r\n</htmlform>\r\n									\r\n								',13,'2011-01-11 17:28:20',13,'2011-05-26 12:43:55',0,'bd9feee8-aba8-49e1-9d97-071344ad7bdc',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03  9:56:31
