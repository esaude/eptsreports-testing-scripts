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
-- WHERE:  form_id = 119

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (21,119,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>SOLICITACAO ARV</title>\r\n\r\n<style>\r\n			#h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n.style1 {\r\n	font-size: 12px;\r\n	font-weight: bold;\r\n}\r\n</style>\r\n\r\n\r\n</head>\r\n\r\n<body>\r\n<table width=\"70%\" border=\"1\" align=\"center\">\r\n  <tr>\r\n    <td width=\"28%\" rowspan=\"8\">REPÚBLICA DE MOÇAMBIQUE\r\n    SERVIÇO NACIONAL DE SAÚDE\r\n    Mod. SIS - H-11</td>\r\n    <td colspan=\"2\"><h2 align=\"center\"><strong>Formulário de Solicitação de Medicamentos Anti-retrovirais</strong></h2></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"16%\" align=\"right\">Nome:</td>\r\n    <td width=\"56%\"><lookup expression=\"patient.personName\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"right\">Sexo:</td>\r\n    <td><lookup expression=\"patient.gender\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"right\">Data de nascimento:</td>\r\n    <td><lookup expression=\"patient.birthdate\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"right\">NID:</td>\r\n    <td><lookup expression=\"patient.getPatientIdentifier(2)\"/></td>\r\n  </tr>\r\n</table>\r\n<table width=\"70%\" border=\"1\" align=\"center\">\r\n  <tr>\r\n    <td width=\"28%\" align=\"right\">Unidade Sanitária:</td>\r\n    <td width=\"72%\"><encounterLocation default=\"13\" order=\"13\"/></td>\r\n  </tr>\r\n</table>\r\n<br></br>\r\n\r\n<table width=\"70%\" border=\"1\" align=\"center\">\r\n  <tr>\r\n    <td colspan=\"2\"><strong>5 - Recem-Nascido de:</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><obs conceptId=\"1477\" labelText=\"\" answerConceptIds=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"60%\"><table width=\"97%\" border=\"1\">\r\n      <tr>\r\n        <td colspan=\"3\" align=\"center\">.</td>\r\n      </tr>\r\n      <tr>\r\n        <td width=\"337\" align=\"center\"><strong>Medicamentos</strong></td>\r\n        <td colspan=\"2\" align=\"center\"><strong>Prescrição</strong></td>\r\n      </tr>\r\n      <obsgroup groupingConceptId=\"1795\">\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"d4T-Estavudina (d4T) sol. oral 1mg/ml\" answerConceptId=\"625\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"3TC-Lamivudina (3TC) sol. oral 10mg/ml\" answerConceptId=\"628\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"AZT-Zidovudina (AZT) sol. oral 10mg/ml\" answerConceptId=\"797\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"NFV-Nelfinavir pó pediátrico (AZT) sol. oral 10mg/ml\" answerConceptId=\"635\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"RTV-Ritonavir sol. oral 80mg/ml\" answerConceptId=\"795\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"EFZ-Efavirenz cápsula 50mg\" answerConceptId=\"633\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"NVP-Neverapina susp. oral 10mg/ml\" answerConceptId=\"631\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"ABC-Abacavir (ABC) comprimido 300mg\" answerConceptId=\"814\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"ddl-Didanosina (ddl) comprimido 200mg\" answerConceptId=\"796\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"d4T-Estavudina (d4T) cápsula 30mg\" answerConceptId=\"625\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"3TC-Lamivudina (3TC) comprimido 150mg\" answerConceptId=\"628\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"AZT-Zidovudina (AZT) cápsula 100mg\" answerConceptId=\"797\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"ATC-Zidovudina+Lamivudina (AZT+3TC) comp. 300+150mg\" answerConceptId=\"630\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"ATC-Zidovudina+Lamivudina (AZT+3TC) comp. 300+150mg\" answerConceptId=\"630\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"IDV-Indinavir cápsula 400mg\" answerConceptId=\"749\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"LZN-AZT 300 + 3TC 150 + NVP 200\" answerConceptId=\"1651\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"LSN-D4T 30 + 3TC 150 + NVP 200\" answerConceptId=\"792\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"Zidovudina + Lamivudina + Nelfinavir\" answerConceptId=\"1702\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"Zidovudina + Lamivudina + Efavirez\" answerConceptId=\"1703\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"Zidovudina+Didanosina+Nelfinavir\" answerConceptId=\"1700\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"Abacavir + Lamivudina + Zidovudina\" answerConceptId=\"817\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n        <tr>\r\n          <td><obs conceptId=\"1088\" labelText=\"Abacavir+Didanosina+Nelfinavir\" answerConceptId=\"1701\" answerLabel=\"\"/></td>\r\n          <td width=\"74\"><obs conceptId=\"1793\" labelText=\"\"/></td>\r\n          <td width=\"95\"><obs conceptId=\"1794\" labelText=\"\"/></td>\r\n        </tr>\r\n      </obsgroup>\r\n    </table></td>\r\n    <td width=\"40%\" valign=\"top\"><table width=\"99%\" border=\"1\" align=\"left\">\r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1591\" labelText=\"7 - É ou ja foi Sintomatico?\" answerConceptIds=\"1065,1066,1457\" answerLabels=\"Sim,Não,Sem Informação\"/></td>\r\n        </tr>\r\n      \r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1585\" labelText=\"8 - RN de mae HIV+, Gestante HIV+, Acidente de Trabalho, ou Outros\" answerConceptIds=\"1586,1587,1584,5622\" answerLabels=\"RN de mae HIV+,Gestante HIV+,Acidente de Trabalho,ou Outros\" style=\"dropdown\"/></td>\r\n        </tr>\r\n      \r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1582\" labelText=\"12 - Em uso de Rifampicina:\" answerConceptId=\"1065,1066\" answerLabel=\"\"/></td>\r\n        </tr>\r\n      \r\n      <tr>\r\n        <td colspan=\"2\"><span class=\"style1\">10 - Nevirapina (NVP) no parto:</span></td>\r\n        </tr>\r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1583\" labelText=\"Capsula 200mg\" answerConceptId=\"1583\" answerLabel=\"\"/></td>\r\n        </tr>\r\n      \r\n      <tr>\r\n        <td width=\"167\"><span class=\"style1\">11 - Quimioprofilaxia para PCP:</span></td>\r\n        <td width=\"170\"><obs conceptId=\"1109\" labelText=\"\" answerConceptIds=\"916,1107\" answerLabels=\"Sim,Não\" style=\"radio\"/></td>\r\n      </tr>\r\n      \r\n      \r\n      <tr>\r\n        <td rowspan=\"2\"><strong>13 - CD4 (cel/mm3)</strong></td>\r\n        <td><obs conceptId=\"1695\" dateLabel=\"data:\"/></td>\r\n      </tr>\r\n      <tr></tr>\r\n      <tr>        </tr>\r\n      <tr>\r\n        <td rowspan=\"2\"><strong>14 - % CD4 (Criancas)</strong></td>\r\n        <td><obs conceptId=\"730\" labelText=\"\" dateLabel=\"data:\"/></td>\r\n      </tr>\r\n      <tr>        </tr>\r\n      <tr>\r\n        <td rowspan=\"2\"><strong>15 - C. viral (cop/ml)</strong></td>\r\n        <td><obs conceptId=\"856\" labelText=\"\" dateLabel=\"data:\"/></td>\r\n      </tr>\r\n      <tr>        </tr>\r\n      <tr>\r\n        <td colspan=\"2\"><strong>16 - Exame carga Viral (N, A, b)</strong></td>\r\n        </tr>\r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1574\" labelText=\"\" answerConceptIds=\"1576,1577,1575\" answerLabels=\"A,B,N\" style=\"dropdown\"/></td>\r\n        </tr>\r\n      <tr>\r\n        <td><strong>17 - Prescricao valida para:</strong> </td>\r\n        <td><obs conceptId=\"1290\" labelText=\"\" answerConceptIds=\"\" answerLabels=\"meses\"/></td>\r\n      </tr>\r\n      \r\n      <tr>\r\n        <td colspan=\"2\"><span class=\"style1\">18 - A dispensa da medicacao e ensal.  Para fornecimento de quantitativo para 2 meses, justifique:</span></td>\r\n        </tr>\r\n      <tr>\r\n        <td colspan=\"2\"><obs conceptId=\"1291\" labelText=\"\" answerConceptIds=\"\" answerLabels=\"\" style=\"textarea\" rows=\"2\" cols=\"30\"/></td>\r\n      </tr>\r\n    </table></td>\r\n  </tr>\r\n</table>\r\n\r\n<br></br>\r\n<table width=\"70%\" border=\"1\" align=\"center\">\r\n  <tr>\r\n    <td colspan=\"4\"><strong>19 - Manifestacoes Clinicas</strong></td>\r\n    <td width=\"40%\"><strong>22 - Justificativa de mudança do tratamento anti-retroviral:</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"14%\"><obs conceptId=\"1788\" labelText=\"1. Criptococose\" answerConceptId=\"1219\" answerLabel=\"\"/></td>\r\n    <td width=\"14%\"><obs conceptId=\"1788\" labelText=\"5. MAC\" answerConceptId=\"1796\" answerLabel=\"\"/></td>\r\n    <td width=\"17%\"><obs conceptId=\"1788\" labelText=\"9. Pneumocistose\" answerConceptId=\"882\" answerLabel=\"\"/></td>\r\n    <td width=\"15%\"><obs conceptId=\"1788\" labelText=\"13. Linfoma nao Hodgkin\" answerConceptId=\"5041\" answerLabel=\"\"/></td>\r\n    <td rowspan=\"4\"><obs conceptId=\"1792\" labelText=\"\" answerConceptIds=\"1789,1790,1791,5622\" answerLabels=\"Ausencia de eficacia inicial,Falha terapeutica clinica,Falha terapeutica laboratorial,Outras\" style=\"radio\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><obs conceptId=\"1788\" labelText=\"2. Criptosporidiose\" answerConceptId=\"5034\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"6. Linfoma primario cerebro\" answerConceptId=\"5040\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"10. Esofagite por candida\" answerConceptId=\"5340\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"14. Leucoencefalopatia multifocal progressiva\" answerConceptId=\"5046\" answerLabel=\"\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td><obs conceptId=\"1788\" labelText=\"3. Toxo SNC\" answerConceptId=\"5355\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"7. S. Kaposi\" answerConceptId=\"507\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"11. Histoplasmose dissem\" answerConceptId=\"5038\" answerLabel=\"\"/></td>\r\n    <td>15</td>\r\n  </tr>\r\n  <tr>\r\n    <td><obs conceptId=\"1788\" labelText=\"4. CMV\" answerConceptId=\"5017\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"8. Tuberculose\" answerConceptId=\"58\" answerLabel=\"\"/></td>\r\n    <td><obs conceptId=\"1788\" labelText=\"12. H. soster dissem\" answerConceptId=\"5329\" answerLabel=\"\"/></td>\r\n    <td>16</td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"3\"><strong>21 - SOLICITANTE OU AUTORIZADOR</strong></td>\r\n    <td colspan=\"2\"><strong>22 - AUTORIZADOR</strong></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"right\">Data:</td>\r\n    <td colspan=\"4\"><encounterDate/></td>\r\n  </tr>\r\n  <tr>\r\n    <td align=\"right\">Feito Por:</td>\r\n    <td colspan=\"4\"><encounterProvider role=\"Provider\"/></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"5\" align=\"right\"><submit submitLabel=\"Submeter\"/></td>\r\n  </tr>\r\n</table>\r\n</body>\r\n</html>\r\n\r\n\r\n</htmlform>',13,'2011-01-12 13:06:48',13,'2013-12-13 17:39:59',0,'14c630e2-12ae-4128-9c24-701eb63648b9',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03 10:19:06
