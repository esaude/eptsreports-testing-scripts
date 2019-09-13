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
-- WHERE:  form_id = 125

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` VALUES (27,125,NULL,'<htmlform>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>Termo de Consentimento de Visita</title>\r\n<style>\r\n			h2 { border-bottom: 3px solid red; }\r\n			p { border: 1px solid black; }\r\n			table{\r\n				border-color: #600;\r\n				border-width: 0 0 1px 1px;\r\n				border-style: solid;}\r\n\r\n			td{\r\n				border-color: #600;\r\n				border-width: 1px 1px 0 0;\r\n				border-style: solid;\r\n				margin: 0;\r\n				padding: 4px;\r\n				background-color: #B2DFEE;}\r\n</style>\r\n</head>\r\n<body>\r\n<table width=\"900\" border=\"1\" align=\"center\">\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\">SERVICO TARV - ÁREA DE APOIO PSICOSSOCIAL E ADESAO<br/>\r\n      FORMULÁRIO DE AVALIACAO E PREPARACAO PSICOLÓGICA DO CANDIDATO AO TARV<br/><br/></div>\r\n      <strong><div align=\"center\">TERMO DE CONSENTIMENTO DE VISITA</div></strong><br/>\r\n      <strong>Para esta última questão, esclareca ao paciente a necessidade de obtencão dessas informacões para podermos auxiliá-lo em caso de impossibilidade de se deslocar à Unidade Sanitária, sendo dados confidênciais. Explique que a possibilidade de visita pode fazer parte do tratamento afim de oferecer-lhe um seguimento adequado.</strong><br/>\r\n      <br/>\r\n      Fui informado sobre o meu estado de saúde e que:<br/><br/>\r\n      1. Receberei tratamento e cuidados por esta unidade de saúde<br/>\r\n      2. O tratamento anti-retroviral é para toda a vida<br/>\r\n      3. Devo tomar sempre meus comprimidos, todos os dias e no mesmo horário de acordo com a oritentacão que recebi pois é importante para minha saude<br/>\r\n      4. Comparecer à Unidade Sanitária para as análises, consultas e para levantar os medicamentos porque isso faz parte do meu tratamento.<br/>\r\n      5. Caso eu tenha alguma dificuldade e não consiga comparecer de acordo com a calendarizacão, poderei ser contactado pela Unidade Sanitária para saber o que se passou comigo.<br/>\r\n      6. Concordo de receber visitas de apoio em casa por uma pessoa autorizada pela Unidade Sanitária.<br/>\r\n      <br/>\r\n      Assim, estou completamente de acordo em ser incluido no Programa de Busca Consentida e autorizo o contacto por:    </td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\">INFORMACAO DISPONIVEL NA BASE DE DADOS</td>\r\n  </tr>\r\n  <tr>\r\n    <td width=\"415\">PACIENTE</td>\r\n    <td width=\"469\">CONFIDENTE OU FAMILIAR</td>\r\n  </tr>\r\n  <tr>\r\n    <td>Localidade:<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.region #end\"/><br/>\r\n    Bairro:<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.subregion #end\"/><br/>\r\n    Celula/Quarteirão:<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.neighborhoodCell #end\"/><br/>\r\n    Ponto de Referencia:<lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.address1 #end\"/><br/>\r\n    Contacto:<lookup expression=\"patient.getAttribute(9)\"/>    </td>\r\n    <td><strong>Pessoa de Referencia:</strong><br/>\r\n    Nome:<lookup expression=\"fn.latestObs(1441)\"/> Apelido:<lookup expression=\"fn.latestObs(1442)\"/> Contacto:<lookup expression=\"fn.latestObs(1611)\"/><br/><br/>\r\n    <strong>Confidente:</strong><br/>\r\n    Nome:<lookup expression=\"fn.latestObs(1740)\"/><br/> Contacto:<lookup expression=\"fn.latestObs(1611)\"/>    </td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\">INFORMACAO DE ACTUALIZACAO (TELEMÓVEL / VISITA DOMICILIÁRIA)</td>\r\n  </tr>\r\n  <tr>\r\n    <td>PACIENTE</td>\r\n    <td> FAMILIAR / CONFIDENTE / SECRETARIO</td>\r\n  </tr>\r\n  <tr>\r\n    <td>Para actualizar informacao de endereco e contacto do paciente, visite na actualizacao de informacão demografica</td>\r\n    <td><strong>Pessoa de Referência:</strong><br/>\r\n    <obs conceptId=\"1441\" labelText=\"Nome:\"/> <obs conceptId=\"1442\" labelText=\" Apelido:\"/><br/>\r\n    <obs conceptId=\"1611\" labelText=\"Contacto:\"/><br/><br/>\r\n    <strong>Confidente:</strong><br/>\r\n    <obs conceptId=\"1740\" labelText=\"Nome:\"/>\r\n    <obs conceptId=\"6224\" labelText=\"Contacto:\"/><br/><br/>\r\n    \r\n    <strong>Secretário:</strong><br/>\r\n    <obs conceptId=\"2036\" labelText=\"Nome:\"/>\r\n    <obs conceptId=\"6225\" labelText=\"Contacto:\"/>    </td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\">Data Assinatura Paciente:\r\n        <encounterDate/> \r\n        O Conselheiro: \r\n        <encounterProvider role=\"Provider\" type=\"autocomplete\"/> \r\n        U. Sanitária: \r\n        <encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\"/>\r\n    </div></td>\r\n  </tr>\r\n  <tr>\r\n    <td colspan=\"2\"><div align=\"center\"><submit submitLabel=\"Submeter\"/></div></td>\r\n  </tr>\r\n</table>\r\n\r\n</body>\r\n</html>\r\n\r\n\r\n</htmlform>',13,'2011-09-14 10:00:40',13,'2014-05-07 12:55:20',0,'e76ec23c-6083-4ae0-b5b1-ff6d236d6aa4',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-03 10:20:20
