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
-- WHERE:  form_id = 106

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (8,106,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>FICHA DE LABORATÓRIO</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n				.style1 {\r\n	font-size: 14px;\r\n	font-weight: bold;\r\n	}\r\n</style>\r\n</head>\r\n\r\n<body>\r\n<table width=\"55%\" border=\"1\" align=\"center\">\r\n<tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\" class=\"style1\">FICHA DE LABORATÓRIO</div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>PACIENTE</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"70%\"><div align=\"right\">Nome</div></td>\r\n    <td colspan=\"2\"><lookup expression=\"patient.personName\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">sexo</div></td>\r\n    <td colspan=\"2\"><lookup expression=\"patient.gender\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">NID</div></td>\r\n    <td colspan=\"2\"><lookup expression=\"patient.getPatientIdentifier(2)\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>EXAME</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Data do Pedido</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"6246\" labelText=\"\"/></td>\r\n  </tr>\r\n<tr>\r\n    <td><div align=\"right\">Data da Colheita de Amostra</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"23821\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Data do Resultado</div></td>\r\n    <td colspan=\"2\"><encounterDate/></td>    \r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Unidade Sanitária</div></td>\r\n    <td colspan=\"2\"><encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Técnico</div></td>\r\n    <td colspan=\"2\"><encounterProvider role=\"Provider\" type=\"autocomplete\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>RESULTADOS</strong></div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>HEMATOLOGIA</strong></div></td>\r\n  </tr>\r\n  <obsgroup groupingConceptId=\"1723\">\r\n  <tr>\r\n    <td><div align=\"right\">Globulos Brancos (WBC)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"678\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Globulos Vermelhos (RBC)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"679\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Hemoglobina (HGB ou HB)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"21\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Hematócrito (HCT, PCV)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1015\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Volume Corpuscular Médio (HCV, VCM, VGM)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"851\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Volume Corpuscular Hemoglobina (MCH, HGM, HCM)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1018\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Concentração Média de Hemoglobina Corpuscular (MCHC, CHCM, CMHG)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1017\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Plaquetas (PLT)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"729\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Largura de Distribuição de Globulos Vermelhos (RDW)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1016\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Velocidade de Sedimentação dos Globulos Vermelhos (VS, VHS)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"855\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Volume médio de Plaquetas (MPV)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1307\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Tipagem Sanguinea</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"300\" labelText=\"\" answerConceptIds=\"690,692,694,696,699,701,1230,1231\" answerLabels=\"A POSITIVO,A NEGATIVO,B POSITIVO, B NEGATIVO,O POSITIVO,O NEGATIVO,AB POSITIVO, AB NEGATIVO\"/></td>\r\n  </tr>\r\n  \r\n  <tr>\r\n    <td></td>    \r\n    <td width=\"14%\"><strong>Percentual (%)</strong></td>\r\n	<td width=\"13%\"><strong>Absoluto (#)</strong></td>\r\n  </tr>  \r\n  <tr>\r\n    <td><div align=\"right\">Linfocitos (LYM)</div></td>    \r\n    <td><obs conceptId=\"1021\" labelText=\"\"/></td>\r\n	<td><obs conceptId=\"952\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Neutrofilos (NEUT)</div></td>    \r\n    <td><obs conceptId=\"1022\" labelText=\"\"/></td>\r\n	<td><obs conceptId=\"1330\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Eosinofilo</div></td>   \r\n    <td><obs conceptId=\"1024\" labelText=\"\"/></td>\r\n	 <td><obs conceptId=\"1332\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Basofilo</div></td>\r\n	<td><obs conceptId=\"1025\" labelText=\"\"/></td>\r\n    <td><obs conceptId=\"1333\" labelText=\"\"/></td>    \r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Monocito</div></td>\r\n    <td><obs conceptId=\"1023\" labelText=\"\"/></td>\r\n	<td><obs conceptId=\"1331\" labelText=\"\"/></td>    \r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Teste de VDRL</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"299\" labelText=\"\" answerConceptIds=\"1228,1229\" answerLabels=\"Positivo,Negativo\" style=\"radio\"/></td>\r\n  </tr>\r\n  </obsgroup>\r\n  <obsgroup groupingConceptId=\"1639\">\r\n  <tr>\r\n    <td><div align=\"right\">RPR</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1655\" labelText=\"\" answerConceptIds=\"1228,1229\" answerLabels=\"Positivo,Negativo\" style=\"radio\"/></td>\r\n  </tr>\r\n  \r\n  <tr>\r\n    <td></td>\r\n    <td><strong>Absoluto</strong></td>\r\n    <td><strong>Percentual</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">CD4</div></td>\r\n    <td><obs conceptId=\"5497\" labelText=\"\"/></td>\r\n    <td><obs conceptId=\"730\" labelText=\"\"/></td>\r\n  </tr>\r\n  </obsgroup>\r\n  <obsgroup groupingConceptId=\"1632\">\r\n  <tr>\r\n    <td><div align=\"right\">Carga Viral</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"856\" labelText=\"\"/></td>\r\n  </tr>\r\n  </obsgroup>\r\n  <tr>\r\n    <td><div align=\"right\">Baciloscopia</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"307\" labelText=\"\" answerConceptIds=\"703,664\" answerLabels=\"Positivo,Negativo\" style=\"radio\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><div align=\"center\"><strong>BIOQUIMICA</strong></div></td>\r\n  </tr>\r\n  <obsgroup groupingConceptId=\"1633\">\r\n  <tr>\r\n    <td><div align=\"right\">Albumina (ALB)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"848\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Aspartato Aminotransferase (AST, SGOT, GOT)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"653\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Alanina Aminotransferase (ALT, SGT, GPT)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"654\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Amilase (AMI)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1299\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Bilirrubina (BIL)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"655\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Bilirrubina Direita (CBIL)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1297\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Colesterol Total (COL)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1006\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Lipoproteina de Alta Densidade (HDL Colesterol)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1007\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Lipoproteina de Baixa Densidade (LDL Colesterol)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1008\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Creatinina (Cr)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"790\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Creatinina Quinase (CK ou CPK)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1011\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Fosfatase Alcalina</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"785\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Gama-Glutamil transpeptidase (GGT)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"2077\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Glucose (GLC)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"887\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Lactato Desidrogenase (LDH)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1014\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Lactato</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1012\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Lipase</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1013\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Total Proteina</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"717\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Triglicerides (TG)</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1009\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Ureia</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"857\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Cloreto</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1134\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Potassio</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1133\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Sódio</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1132\" labelText=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><div align=\"right\">Globulinas</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1520\" labelText=\"\"/></td>\r\n  </tr>\r\n  </obsgroup>\r\n  <tr>\r\n    <td><div align=\"right\">PCR</div></td>\r\n    <td colspan=\"2\"><obs conceptId=\"1030\" labelText=\"\" answerConceptIds=\"703,664,1138\" answerLabels=\"Pos.,Neg.,Ind.\" style=\"radio\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\">\r\n    <div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n  </tr>\r\n  </tbody>\r\n</table>\r\n</body>\r\n</html>\r\n\r\n\r\n</htmlform>',13,'2011-01-11 17:23:53',1,'2019-03-26 13:12:05',0,'45acd87b-3daa-49a6-8f50-9cc38f318761',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03  9:56:23