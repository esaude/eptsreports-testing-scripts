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
-- WHERE:  form_id = 132

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (34,132,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>FICHA DE AVALIAÇÃO PSICOSSOCIAL E DE PREVENÇÃO POSITIVA</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n		.style1 {\r\n	font-size: 14px;\r\n	font-weight: bold;\r\n}\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<table width=\"500\" border=\"1\" align=\"center\">\r\n<tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td colspan=\"8\"><div align=\"center\" class=\"style1\">REPÚBLICA DE MOÇAMBIQUE<br />SERVIÇO NACIONAL DE SAÚDE<br />FICHA DE AVALIAÇÃO PSICOSSOCIAL E DE PREVENÇÃO POSITIVA</div></td>\r\n  </tr>\r\n  \r\n  <tr>\r\n    <td colspan=\"6\"><div align=\"right\">Nome:</div></td>\r\n    <td colspan=\"2\"><lookup expression=\"patient.personName\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"6\"><div align=\"right\">Sexo:</div></td>\r\n    <td colspan=\"2\"><lookup expression=\"patient.gender\"/></td>\r\n  </tr>\r\n  \r\n  <tr>\r\n    <td colspan=\"6\"><div align=\"right\">NID:</div></td>\r\n    <td colspan=\"2\">\r\n      <lookup expression=\"patient.getPatientIdentifier(2)\"/></td>\r\n  </tr>\r\n  \r\n  \r\n \r\n  <tr>\r\n    <td colspan=\"14\"><div align=\"center\"><strong>Seguimento de Adesão </strong> Data:<encounterDate/>\r\n    </div></td>\r\n    </tr>\r\n  <tr>\r\n    <td rowspan=\"2\"><div align=\"center\"><strong>Actividade</strong></div></td>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>Tipo de Visita</strong></div></td>\r\n    <td colspan=\"4\"><div align=\"center\"><strong>Resultados/Observações</strong></div></td>\r\n    </tr>\r\n  <tr>\r\n    <td>Normal</td>\r\n    <td>Baixa Adesão</td>\r\n    <td>Abandono</td>\r\n    <td>Boa</td>\r\n    <td>Risco</td>\r\n    <td>Baixa</td>\r\n    <td>Data Próxima consulta</td>\r\n  </tr>\r\n  <tr>\r\n    <td><obs conceptId=\"6314\" labelText=\"\" answerConceptIds=\"6312,6313,5488\" answerLabels=\"Acolhimento,Aconselhamento Pré-TARV,Seguimento de Aconselhamento\"/></td>\r\n    <td><obs conceptId=\"6315\" answerConceptId=\"1115\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6315\" answerConceptId=\"6311\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6315\" answerConceptId=\"1707\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6223\" answerConceptId=\"1383\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6223\" answerConceptId=\"1749\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6223\" answerConceptId=\"1385\" labelText=\"\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"6310\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"8\"><div align=\"center\"><strong>Registo das Intervenções de Prevenção Positiva</strong></div></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\"><div align=\"center\"><strong>Componentes de PP</strong></div></td>\r\n    <td colspan=\"4\"><div align=\"center\"><strong>Visitas Clinicas e de Apoi Psicossocial</strong></div></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP1 - Comportamento sexual e oferta de preservativos</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6317\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP2 - Revelação do seu seroestado e conhecimento/convite para testagem do parceiro</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6318\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP3 - Adesão ao Cuidados e Tratamento</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6319\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP4 - Infecções de Transmissão Sexual (ITS)</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6320\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td rowspan=\"2\">PP5</td>\r\n    <td colspan=\"3\">Planeamento Familiar (PF)</td>\r\n    <td colspan=\"4\"><obs conceptId=\"5271\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"3\">Prevenção da Transmissão Vertical (PTV)</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6316\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP6 - Consumo de álcool e outras drogas</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6321\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  <tr>\r\n    <td colspan=\"4\">PP7 - Necessidade de serviços para apoio comunitário</td>\r\n    <td colspan=\"4\"><obs conceptId=\"6322\" labelText=\"\" answerConceptIds=\"1065,1066\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n    </tr>\r\n  \r\n   <tr>\r\n     <td colspan=\"4\">Unidade Sanitária: <encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\"/></td>\r\n     <td colspan=\"4\">Conselheiro: <encounterProvider role=\"Provider\" type=\"autocomplete\"/></td>\r\n     </tr>\r\n   <tr>\r\n    <td colspan=\"8\"><div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n  </tr>\r\n  </tbody>\r\n</table>\r\n</body>\r\n</html>\r\n</htmlform>',13,'2013-06-24 17:04:16',13,'2014-05-07 12:54:13',0,'247cf979-5015-42f3-baf4-dd415e694ab8',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03 10:21:42
