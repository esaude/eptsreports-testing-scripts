-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: metadata
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
-- WHERE:  form_id=141

LOCK TABLES `htmlformentry_html_form` WRITE;
/*!40000 ALTER TABLE `htmlformentry_html_form` DISABLE KEYS */;
INSERT INTO `htmlformentry_html_form` (`form_id`,`name`,`xml_data`,`creator`,`date_created`,`changed_by`,`date_changed`,`retired`,`uuid`,`description`,`retired_by`,`date_retired`,`retire_reason`)
VALUES (166,NULL,'<htmlform>\r\n\r\n        <html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n        <head>\r\n        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n        <title>FILA</title>\r\n            \r\n        <style>\r\n                h2 { border-bottom: 3px solid red; }\r\n                p { border: 1px solid black; }\r\n                \r\n                \r\n                table{\r\n                    border: 3px solid #1aac9b;\r\n                    border-collapse: collapse;\r\n                }\r\n    \r\n                tr:first-child {\r\n                    background-color: #1aac9b;\r\n                }\r\n    \r\n                tr:first-child label {\r\n                    padding: 4px !important;\r\n                    color: #fff;\r\n                    font-weight: bold;\r\n                    margin: 4px !important;\r\n                    text-shadow: 0 0 .3em black;\r\n                    font-size: 12pt;\r\n                }\r\n    \r\n                td {\r\n                    border: 1px solid #1aac9b;\r\n                }\r\n                    \r\n            .style1 {\r\n                font-size: 14px;\r\n                font-weight: bold;\r\n            }\r\n    \r\n            .obs{\r\n                font-size: 14px;\r\n                font-weight: bold;\r\n            }\r\n    \r\n            .submit-btn {\r\n                        flex: 1;\r\n                        margin: 10px 15px;\r\n                    }\r\n    \r\n            .submit-btn input{\r\n                color: #fff;\r\n                background: #1aac9b;\r\n                padding: 8px;\r\n                width: 12.8em;\r\n                font-weight: bold;\r\n                text-shadow: 0 0 .3em black;\r\n                font-size: 9pt;\r\n                border-radius: 5px 5px;\r\n            }\r\n        </style>\r\n        </head>\r\n        <body>\r\n        <table width=\"900\" border=\"1\" align=\"center\">\r\n          <tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n          <tr>\r\n            <td width=\"285\" rowspan=\"4\" align=\"center\">REPÚBLICA DE MOÇAMBIQUE<br/>Serviço Nacional de Saúde <br/><br/> NID: <lookup expression=\"patient.getPatientIdentifier(2)\"/></td>\r\n            <td colspan=\"2\"  height=\"30\" ><div align=\"center\" class=\"style1\"><label>Registo de Levantamento de ARVs Master Card</label></div></td>\r\n          </tr>\r\n          \r\n          <tr>\r\n            <td width=\"245\"><div align=\"right\">Nome:</div></td>\r\n            <td width=\"348\"><lookup expression=\"patient.personName\"/></td>\r\n          </tr>\r\n          <tr>\r\n            <td><div align=\"right\">Contacto:</div></td>\r\n            <td><lookup expression=\"patient.getAttribute(9)\"/></td>\r\n          </tr>\r\n          <tr>\r\n            <td><div align=\"right\">Endereço:</div></td>\r\n            <td><lookup complexExpression=\"#foreach( $addr in $patient.addresses ) $!addr.subregion #end\"/></td>\r\n          </tr>\r\n          \r\n          </tbody>\r\n        </table>\r\n        \r\n        <br/>\r\n        \r\n        <table width=\"900\" border=\"1\" align=\"center\">\r\n          <tbody align=\"left\" style=\"font-family:verdana; font-size:12px\">\r\n          \r\n          <tr>\r\n            <td><div align=\"right\">Unidade Sanitária:</div></td>\r\n            <td>\r\n        <encounterLocation id=\"localConsulta\" default=\"GlobalProperty:default_location\" type=\"autocomplete\"/>	\r\n            </td>\r\n          </tr>  \r\n            \r\n          <tr style=\"display: none;\">\r\n            <td><div align=\"right\">Recepcionista:</div></td>\r\n            <td><encounterProvider role=\"Provider\" default=\"generic.provider\" widget=\"hidden\"/></td>\r\n          </tr>\r\n          \r\n          <tr>\r\n            <td><div align=\"right\">Data de Registo:</div></td>\r\n            <td><encounterDate id=\"encounterDate\"  widget=\"hidden\" default=\"today\"/></td>\r\n          </tr>\r\n          \r\n          \r\n          <tr>\r\n            <td><div align=\"right\">Levantou ARV:</div></td>\r\n            <td>\r\n                <obs conceptId=\"e07fb227-7a5a-4edf-93e8-7633c9fd1ea0\" labelText=\"\" answerConceptIds=\"e1d81b62-1d5f-11e0-b929-000c29ad1d07,e1d81c70-1d5f-11e0-b929-000c29ad1d07\" answerLabels=\"S, N\" style=\"radio\" required=\"true\"/>\r\n                \r\n            </td>\r\n          </tr> \r\n          <tr>\r\n            <td><div align=\"right\">Data do Levantamento:</div></td>\r\n            <td>	\r\n                <obs id=\"dataLevantamento\" conceptId=\"74f6c17f-9819-41da-ba34-5910f67d24d0\" labelText=\"\" allowFutureDates=\"true\" required=\"true\"/>	\r\n            </td>\r\n          </tr>\r\n          <tr>\r\n            <td colspan=\"2\"><div align=\"center\">\r\n                <div class=\"submit-btn\"><submit submitLabel=\"Submeter\"/></div>\r\n            </div></td>\r\n          </tr>\r\n          </tbody>\r\n        </table>\r\n        \r\n        </body>\r\n        </html>\r\n        </htmlform>',1,'2019-07-09 13:09:23',1,'2019-09-02 10:15:59',0,'597a00b1-ae77-4f40-b8c7-fb79783e8e56',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-09-11 12:04:14
