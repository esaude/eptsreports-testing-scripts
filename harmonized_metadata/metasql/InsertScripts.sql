-- Person attribute types

INSERT INTO `person_attribute_type` VALUES 
(1,'Race','Group of persons related by common descent or heredity','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d871386-c2cc-11de-8d13-0010c6dffd0f',11),
(2,'Birthplace','Location of persons birth','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d8718c2-c2cc-11de-8d13-0010c6dffd0f',0),
(3,'Citizenship','Country of which this person is a member','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d871afc-c2cc-11de-8d13-0010c6dffd0f',1),
(4,'Mother\'s Name','First or last name of this person\'s mother','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d871d18-c2cc-11de-8d13-0010c6dffd0f',7),
(5,'Civil Status','Marriage status of this person','org.openmrs.Concept',1054,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d871f2a-c2cc-11de-8d13-0010c6dffd0f',2),
(6,'Health District','District/region in which this patient home health center resides','java.lang.String',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d872150-c2cc-11de-8d13-0010c6dffd0f',5),
(7,'Health Center','Specific Location of this person home health center.','org.openmrs.Location',NULL,0,1,'2007-05-04 09:59:23',NULL,NULL,0,NULL,NULL,NULL,NULL,'8d87236c-c2cc-11de-8d13-0010c6dffd0f',4),
(8,'Distrito','','java.lang.String',NULL,0,1,'2008-10-14 03:32:10',1,'2008-10-16 13:41:21',0,NULL,NULL,NULL,NULL,'e2e3fc10-1d5f-11e0-b929-000c29ad1d07',3),
(9,'Numero de Telefone','Telefone de contacto do paciente','java.lang.String',NULL,0,1,'2019-04-03 10:58:40',1,'2019-04-03 10:58:40',0,NULL,NULL,NULL,NULL,'e2e3fd64-1d5f-11e0-b929-000c29ad1d07',4),
(10,'Organização','affiliation, used for providers, social assistants','org.openmrs.Concept',1696,1,1,'2008-10-24 11:16:16',1,'2008-10-24 11:34:41',0,NULL,NULL,NULL,NULL,'e2e3feae-1d5f-11e0-b929-000c29ad1d07',10),
(11,'Local de Trabalho','Lugar onde a pessoa trabalha','java.lang.String',NULL,0,1,'2009-05-08 09:54:26',NULL,NULL,0,NULL,NULL,NULL,NULL,'e2e3fff8-1d5f-11e0-b929-000c29ad1d07',6),
(12,'Número de Cartão','Número do cartão do paciente no serviço TARV ou outro serviço crónico','java.lang.String',NULL,0,1,'2010-12-08 09:34:19',1,'2010-12-08 09:35:38',0,NULL,NULL,NULL,NULL,'e2e40142-1d5f-11e0-b929-000c29ad1d07',8),
(13,'Pessoa de referencia','','org.openmrs.Concept',1441,1,1,'2011-09-08 15:05:21',NULL,NULL,0,NULL,NULL,NULL,'Add Patients','4d9d4863-6637-4aba-a907-f2e60f5be9c0',12),
(17,'Identificador definido localmente 01',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:12:06',1,'2019-03-26 12:52:28',0,NULL,NULL,NULL,NULL,'c89c90eb-5b03-4899-ab9f-06fecd123511',13),
(18,'Identificador definido localmente 02',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:12:30',1,'2019-03-26 12:53:08',0,NULL,NULL,NULL,NULL,'0eeed36f-ae3b-4fdc-95c1-d6ac6b246631',14),
(19,'Identificador definido localmente 03',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:12:47',1,'2019-03-26 12:53:29',0,NULL,NULL,NULL,NULL,'c79d2ebc-1c3b-4634-9df3-44cc3b2bf218',15),
(20,'Identificador definido localmente 04',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:13:10',1,'2019-03-26 12:53:49',0,NULL,NULL,NULL,NULL,'d0733f76-6da4-4ee7-93e7-87abca9837c8',16),
(21,'Identificador definido localmente 05',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:13:33',1,'2019-03-26 12:54:01',0,NULL,NULL,NULL,NULL,'971aeb85-7f5d-44cf-a3ef-61571dd5c57f',17),
(22,'Identificador definido localmente 06',NULL,'java.lang.String',NULL,0,1,'2019-03-25 15:14:36',1,'2019-03-26 12:54:20',0,NULL,NULL,NULL,NULL,'d140b1ad-4581-492e-8291-155abeafa070',18),
(23,'Identificador definido localmente 07',NULL,'java.lang.String',NULL,0,1,'2019-03-26 12:54:52',NULL,NULL,0,NULL,NULL,NULL,NULL,'28f9794a-590f-4a25-b09a-5b44fa22c930',19),
(24,'Identificador definido localmente 08',NULL,'java.lang.String',NULL,0,1,'2019-03-26 12:55:11',NULL,NULL,0,NULL,NULL,NULL,NULL,'8e57516d-775f-45ef-8ae1-6898d0055655',20),
(25,'Identificador definido localmente 09',NULL,'java.lang.String',NULL,0,1,'2019-03-26 12:55:30',NULL,NULL,0,NULL,NULL,NULL,NULL,'2c1e4a1b-5724-4c2d-9ff5-68bda4802079',21),
(26,'Identificador definido localmente 10',NULL,'java.lang.String',NULL,0,1,'2019-03-26 12:55:56',NULL,NULL,0,NULL,NULL,NULL,NULL,'c649dae9-13b6-4c0d-9edc-6b1d304b13f4',22);


-- Identifier types

INSERT INTO `patient_identifier_type` VALUES 
(1,'OpenMRS Identification Number','Unique number used in OpenMRS','',1,1,'2005-09-22 00:00:00',0,NULL,'org.openmrs.patient.impl.LuhnIdentifierValidator',0,NULL,NULL,NULL,'8d793bee-c2cc-11de-8d13-0010c6dffd0f',NULL,NULL),
(2,'NID (SERVICO TARV)','Numero de Identificaçao de Doente, serviço TARV','[0-9]{8}/[0-9]{2}/[0-9]{4}',0,1,'2005-09-22 00:00:00',0,'PPDDUUSS/AA/NNNNN',NULL,0,NULL,NULL,NULL,'e2b966d0-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(3,'BILHETE DE IDENTIDADE (BI)','O Bilhete de Identidade referido no artigo anterior é válido em todo o território nacional e é documento bastante para prova de identidade do deu possuidor.','[0-9]{9}[A-Z]{1}',0,1,'2008-10-22 11:57:54',0,'000000000X','',0,NULL,NULL,NULL,'e2b9682e-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(5,'CODIGO ATS/UATS','Codigo do paciente no serviço de ATS/UATS','',0,1,'2008-11-14 09:35:37',0,'YY/####','',0,NULL,NULL,NULL,'e2b9698c-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(6,'CODIGO PTV (PRE-NATAL)','Number used to track PTV participants','',0,1,'2008-11-14 09:36:49',0,'YY/####','',0,NULL,NULL,NULL,'e2b96ad6-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(7,'CODIGO ITS','ITS Codigo Infecção de Transmissão Sexual\r\nSTI Codigo Sexually transmitted infection','',0,1,'2008-11-14 10:18:47',0,'YY/####','',0,NULL,NULL,NULL,'e2b96c16-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(8,'CODIGO PTV (MATERNIDADE)','Codigo PTV Maternidade','',0,1,'2008-11-17 15:30:50',0,'YY/####','',0,NULL,NULL,NULL,'e2b96d56-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(9,'NID (CCR)','Child at risk NID','',0,1,'2008-11-17 16:36:57',0,'YY/####CE','',0,NULL,NULL,NULL,'e2b97b70-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(10,'PCR (NUMERO DE REGISTO)','PCR Registration number','',0,1,'2008-12-10 10:29:32',0,'','',0,NULL,NULL,NULL,'e2b97cec-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(11,'NIT (SECTOR DE TB)','Numero de identificacao do doente no sector de tuberculose',NULL,0,1,'2009-05-08 08:44:11',0,NULL,NULL,0,NULL,NULL,NULL,'e2b97e40-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(12,'NUMERO CANCRO CERVICAL','Numero de registo de paciente para rastreio do cancro do colo uterino','[0-9]/[0-9]{4}',0,1,'2010-02-15 07:48:08',0,'NNNNNN/20_ _','',0,NULL,NULL,NULL,'e2b97f8a-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(14,'NUIC','Numero unico de Identificacao do Cidadao','[0-9]{13}',0,1,'2019-03-26 13:00:26',0,'PPDDSSSSSSSSG (Nacional) / PPNNSSSSSSSSG (Estrangeiro)',NULL,0,NULL,NULL,NULL,'e89c8925-35cc-4a29-9002-6b36bf3fd47f',NULL,NULL);


-- Program

INSERT INTO `program` VALUES 
(1,1781,1,'2012-02-29 09:42:25',1,'2013-07-24 11:45:26',0,'SERVICO TARV - CUIDADO','Programa de seguimento e cuidado aos pacientes HIV+','7b2e4a0a-d4eb-4df7-be30-78ca4b28ca99',NULL),
(2,6274,1,'2012-02-29 09:46:38',1,'2013-07-24 11:45:49',0,'SERVICO TARV - TRATAMENTO','Programa de seguimento e tratamento aos pacientes HIV+','efe2481f-9e75-4515-8d5a-86bfde2b5ad3',NULL),
(3,1598,1,'2012-02-29 09:50:12',1,'2013-07-24 07:50:47',1,'PTV-CPN','Programa de Prevencao da Transmissao vertical - Consulta Pre-Natal','67888201-b026-46dd-a028-62481a4c6a18',NULL),
(4,2048,1,'2012-02-29 09:52:18',1,'2013-07-24 07:51:14',1,'PTV-MATERNIDADE','Programa de Prevencao da Transmissao vertical - Maternidade','acfc6a4e-3a4d-48c7-955c-95af2b436578',NULL),
(5,1782,1,'2012-02-29 10:03:57',1,'2013-07-24 11:46:08',0,'TUBERCULOSE','Programa de Combate a Tuberculose','142d23c4-c29f-4799-8047-eb3af911fd21',NULL),
(6,1872,1,'2012-02-29 10:05:21',1,'2013-07-24 11:46:31',0,'CCR','Programa de consultas para criancas em risco (CCR)','611f0a6b-68b7-4de7-bc7a-fd021330eef8',NULL),
(7,1570,1,'2012-02-29 10:06:55',NULL,NULL,0,'CCU','Programa de Rastreio de Cancro do Colo de Utero','8954a750-079e-4bf2-940c-b4f71ea8bb15',NULL),
(8,1598,1,'2012-06-26 11:30:33',1,'2013-07-24 07:56:14',0,'PTV/ETV','Programa de representa o estado de gravidez de uma mulher','06057245-ca21-43ab-a02f-e861d7e54593',NULL),
(9,1386,1,'2013-07-24 07:50:23',1,'2013-07-24 07:53:17',0,'CLINICA MOVEL','Seguimento de pacientes atraves da Clinica Móvel','fb455824-fb53-45ab-bf5a-a81482ff6848',NULL);


-- Programs Workflow

INSERT INTO `program_workflow` VALUES 
(1,1,6275,1,'2012-02-29 10:11:08',0,1,'2013-07-24 11:45:26','beea7be9-cbf5-4a15-923a-ff193eea9d50'),
(2,2,6276,1,'2012-02-29 10:17:25',0,1,'2013-07-24 11:45:49','a59bd818-d2f0-4a9a-a2f2-0a54af4ce04e'),
(3,6,6280,1,'2012-02-29 16:56:59',0,1,'2013-07-24 11:46:31','ce8e82d3-f1e8-4263-8dcf-0b20740b0221'),
(4,5,6281,1,'2012-02-29 17:00:42',0,1,'2013-07-24 11:46:08','8ac84757-6fb0-4b56-ac51-50d5efb004af'),
(5,8,5272,1,'2012-06-26 11:39:12',0,1,'2013-07-24 07:56:14','38b2c29f-496c-4b3d-b792-e2f7cdc7c8b7');

-- Programs Workflows State

INSERT INTO `program_workflow_state` VALUES 
(1,1,6269,1,0,1,'2012-02-29 10:16:55',0,1,'2013-07-24 11:45:26','e21bd1bf-13a8-4cb7-8d7b-fb830771f64a'),
(2,1,1707,0,0,1,'2012-02-29 10:16:55',0,1,'2013-07-24 11:45:26','8e27ada6-bcac-49c8-a15b-be0a8404ea6c'),
(3,1,1706,0,0,1,'2012-02-29 10:16:55',0,1,'2013-07-24 11:45:26','6f67b68d-f04d-4644-bac1-c9926b08a768'),
(4,1,1256,0,1,1,'2012-02-29 10:16:55',0,1,'2013-07-24 11:45:26','1761fab2-32b8-46e6-b171-7ca6ad92971c'),
(5,1,1366,0,1,1,'2012-02-29 10:16:55',0,1,'2013-07-24 11:45:26','bc1b79f9-97e2-46c5-b6e3-dd87301cacb0'),
(6,2,6269,1,0,1,'2012-02-29 10:20:45',0,1,'2013-07-24 11:45:49','c50d6bdc-8a79-43ae-ab45-abbaa6b45e7d'),
(7,2,1706,0,0,1,'2012-02-29 10:20:45',0,1,'2013-07-24 11:45:49','9f2f86e9-303c-4b98-a6ae-37e8806a6f47'),
(8,2,1709,0,0,1,'2012-02-29 10:20:45',0,1,'2013-07-24 11:45:49','05cf5297-12ed-4f6b-8c21-70d8ae04e09f'),
(9,2,1707,0,0,1,'2012-02-29 10:20:45',0,1,'2013-07-24 11:45:49','06124f77-4a49-49f8-8655-fa1fe5262936'),
(10,2,1366,0,1,1,'2012-02-29 10:20:45',0,1,'2013-07-24 11:45:49','fcad8a57-2a1a-4abd-84b7-935897e4fe06'),
(11,3,6269,1,0,1,'2012-02-29 17:00:20',0,1,'2013-07-24 11:46:31','a42ec725-0635-462d-ac1a-6c34235099f2'),
(13,3,1798,0,0,1,'2012-02-29 17:00:20',0,1,'2013-07-24 11:46:31','5459a2d4-ba79-4c14-98ba-264114455da8'),
(14,3,1707,0,0,1,'2012-02-29 17:00:20',0,1,'2013-07-24 11:46:31','3ba61212-c55a-405f-8188-b2a1f6b94605'),
(15,3,1366,0,1,1,'2012-02-29 17:00:20',0,1,'2013-07-24 11:46:31','a327038e-e1a1-4e5e-8e97-5b0d94e52b21'),
(16,4,6269,1,0,1,'2012-02-29 17:02:45',0,1,'2013-07-24 11:46:08','d3fd193f-19aa-42cb-85db-cf9113d9cf4a'),
(20,4,1707,0,0,1,'2012-02-29 17:02:45',0,1,'2013-07-24 11:46:08','e8d30eb0-e0ee-495d-a589-1cf2983abc9e'),
(21,4,1706,0,0,1,'2012-02-29 17:02:45',0,1,'2013-07-24 11:46:08','c55cf294-e2d8-4de0-8d51-601c4b74d534'),
(22,4,1366,0,1,1,'2012-02-29 17:02:45',0,1,'2013-07-24 11:46:08','ef2ef653-ce06-41e1-bf10-d028b00ce0b4'),
(23,3,6301,0,1,1,'2012-06-26 10:11:42',0,1,'2013-07-24 11:46:31','4da5c27a-fb03-44af-8ab6-5dad2bf64ada'),
(24,4,6302,0,1,1,'2012-06-26 10:34:23',0,1,'2013-07-24 11:46:08','5f7694b9-37e8-4c71-bf2f-95d50d91267f'),
(25,5,1982,1,0,1,'2012-06-26 11:40:22',0,1,'2013-07-24 07:56:14','8e3d2224-b91f-4978-95ba-683929011086'),
(26,5,50,0,1,1,'2012-06-26 11:40:22',0,1,'2013-07-24 07:56:14','ab226555-f6b0-4b50-9268-2e3c53988ed1'),
(27,5,6248,0,1,1,'2012-06-26 11:40:22',0,1,'2013-07-24 07:56:14','1fa545c3-ba8b-4979-b6eb-62a96ad844af'),
(28,1,1369,1,0,1,'2013-07-24 11:45:26',0,NULL,NULL,'b227d4ff-2dc3-4c18-9a58-d4de8d077746'),
(29,2,1369,1,0,1,'2013-07-24 11:45:49',0,NULL,NULL,'ef06e6df-6026-4d5a-88f9-b2c3e0495dc8'),
(30,4,1369,1,0,1,'2013-07-24 11:46:08',0,NULL,NULL,'e867d310-2b7f-4730-87e5-f91617c588d7'),
(31,3,1369,1,0,1,'2013-07-24 11:46:31',0,NULL,NULL,'8c9a0ddf-a44f-4acb-b011-ef886f65cee5');

-- Visit Types

INSERT INTO `visit_type` VALUES 
(1,'SEGUIMENTO PTV','Visita de seguimento no serviço de PTV','056a9354-320f-4b12-9db3-187e12e20b76',1,'2013-01-10 09:53:18',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(2,'ABERTURA DE PROCESSO TB','Visita de abertura de processo no serviço de TB','26690ee5-b451-4850-b41e-41a7c87b31e9',1,'2013-01-10 09:54:07',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(3,'SEGUIMENTO SEGUINTE S. TARV','Visita seguinte de seguimento','3866891d-09c5-4d98-98de-6ae7916110fa',1,'2013-01-08 16:39:15',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(4,'SEGUIMENTO CCR','Visita de seguimento no serviço de CCR','396c0cd8-0b77-425c-a4b9-bb4da976ebcb',1,'2013-01-10 09:56:35',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(5,'PRIMEIRO SEGUIMENTO S.TARV','Primeira visita de seguimento no servico TARV','64a510a1-fbf4-465f-acd2-cd37bc321cee',1,'2013-01-08 16:38:18',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(6,'INTERNAMENTO','Visita na qual o paciente é internado na unidade sanitária','744ebe99-c086-4b2c-bfbb-a68ed4741e49',1,'2013-01-10 11:25:40',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(7,'LABORATORIO','Visita de laboratorio','b3114b6e-7c8e-4c2d-89d5-d45b368d0625',1,'2013-01-08 16:41:41',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(8,'LEVANTAMENTO DE ARV','Visita para levantamento de ARV','b5e7993c-7429-4c63-bb82-a66cd15553b0',1,'2013-01-08 16:39:42',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(9,'ABERTURA PROCESSO PTV','Visita de abertura do processo no serviço de PTV','c066031d-338c-4573-9f3a-2f774caebd52',1,'2013-01-10 09:52:42',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(10,'ACONSELHAMENTO','Visita de aconselhamento','c607f451-92a9-45bf-b418-5288645a335d',1,'2013-01-08 16:40:33',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(11,'ABERTURA DE PROCESSO CCR','Visita de abertura de processo no serviço de CCR','cbcb03a4-b90a-4351-93ee-4b118ed4f6c3',1,'2013-01-10 09:55:53',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(12,'ABERTURA PROCESSO S. TARV','Visita inicial de abertura de processo clinico no serviço TARV','ceae3031-b8a7-47dc-9d4a-700d73dda335',1,'2013-01-08 16:37:31',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(13,'SEGUIMENTO TB','Visita de seguimento no serviço de TB','d9911494-b231-4b3c-9246-1fe5f269476c',1,'2013-01-10 09:54:36',1,'2013-01-18 16:46:59',0,NULL,NULL,NULL),
(14,'LIVRO DE REGISTO TARV','Livro de registo TARV e PRE-TARV','1cfb7589-c648-45d3-b524-3e8bff50a3c1',1,'2013-03-01 09:45:41',NULL,NULL,0,NULL,NULL,NULL),
(15,'VISITA DOMICILIARIA','Visita domiciliaria','85b891bf-4ef9-4c08-9c1e-b92c5bd441b0',1,'2013-03-25 09:43:16',NULL,NULL,0,NULL,NULL,NULL);

-- Encounter Types

INSERT INTO `encounter_type` VALUES 
(1,'S.TARV: ADULTO INICIAL B','Outpatient Adult Initial Visit part 2',1,'2005-02-24 00:00:00',0,NULL,NULL,NULL,'e278f1c2-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(2,'MISAU: ITS','REGISTO DIARIO DE CASOS DE DTS',1,'2005-02-24 00:00:00',0,NULL,NULL,NULL,'e278f460-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(3,'S.TARV: PEDIATRIA INICIAL B','Primeira visita de paciente pediatrico, parte B. As duas ultimas paginas',1,'2005-02-24 00:00:00',0,NULL,NULL,NULL,'e278f5aa-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(4,'TEMPLATE','Encounter type for all template forms',1,'2005-02-24 00:00:00',0,NULL,NULL,NULL,'e278f6ea-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(5,'S.TARV: ADULTO INICIAL A','Primeira visita do paciente adulto',1,'2008-10-13 04:31:00',0,NULL,NULL,NULL,'e278f820-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(6,'S.TARV: ADULTO SEGUIMENTO','seguimento visita do paciente adulto',1,'2008-10-13 04:32:34',0,NULL,NULL,NULL,'e278f956-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(7,'S.TARV: PEDIATRIA INICIAL A','Primeira visita do paciente pediatria',1,'2008-10-13 04:33:15',0,NULL,NULL,NULL,'e278fa8c-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(8,'CCR: PROCESSO','Primeira visita do Criança em risco',1,'2008-10-13 04:34:46',0,NULL,NULL,NULL,'e278fbb8-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(9,'S.TARV: PEDIATRIA SEGUIMENTO','Seguimento visita do paciente pediatria',1,'2008-10-13 11:35:34',0,NULL,NULL,NULL,'e278fce4-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(10,'CCR: SEGUIMENTO','Seguimento visita do Criança Em Risco',1,'2008-10-13 11:36:27',0,NULL,NULL,NULL,'e278fe10-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(11,'PTV: PRE-NATAL INICIAL','Prevenção Transmisiveis Vertical',1,'2008-10-13 11:38:27',0,NULL,NULL,NULL,'e278ff3c-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(12,'PTV: PRE-NATAL SEGUIMENTO','Prevenção Transmisiveis Vertical\r\n',1,'2008-10-13 11:38:53',0,NULL,NULL,NULL,'e2790072-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(13,'MISAU: LABORATORIO','Laboratorio',1,'2008-10-13 11:40:16',0,NULL,NULL,NULL,'e2790f68-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(14,'MISAU: ATS','Aconselhamento e Testagem de Saude\r\n',1,'2008-10-13 11:40:58',0,NULL,NULL,NULL,'e27910d0-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(17,'S.TARV: SOLICITAÇÃO ARV','Solicitação de Medicamentos Anti-Retrovirais',1,'2008-10-13 11:44:12',0,NULL,NULL,NULL,'e2791206-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(18,'S.TARV: FARMACIA','Farmacia',1,'2008-10-25 15:07:04',0,NULL,NULL,NULL,'e279133c-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(19,'S.TARV: ACONSELHAMENTO','MISAU/HDD TARV Aconselhamento',1,'2008-11-20 14:50:00',0,NULL,NULL,NULL,'e2791472-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(20,'TUBERCULOSE: RASTREIO','TUBURCULOSE: RASTREIO',1,'2008-11-20 14:51:46',0,NULL,NULL,NULL,'e27915a8-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(21,'S.TARV: BUSCA ACTIVA','Busca Activa',1,'2008-12-09 14:19:56',0,NULL,NULL,NULL,'e27916d4-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(22,'CCR: PCR','TESTE DE PCR',1,'2008-12-15 10:46:59',0,NULL,NULL,NULL,'e2791800-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(23,'PTV: MATERNIDADE','Prevencao de transmissao vertical na maternidade',1,'2008-12-15 10:57:49',0,NULL,NULL,NULL,'e2791936-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(24,'S.TARV: ACONSELHAMENTO SEGUIMENTO','Seguimento Aconselhamento',1,'2009-01-05 12:56:48',0,NULL,NULL,NULL,'e2791a62-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(25,'TUBERCULOSE: LIVRO','Livro de Registo de Doentes com Tuberculose',1,'2009-04-21 14:59:55',0,NULL,NULL,NULL,'e2791b98-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(26,'TUBERCULOSE: PROCESSO','TRATAMENTO DE TUBERCULOSE',1,'2009-05-08 08:32:07',0,NULL,NULL,NULL,'e2791cc4-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(27,'TUBERCULOSE: SEGUIMENTO','Seguimento de doentes com tuberculose',1,'2009-07-08 16:33:02',0,NULL,NULL,NULL,'e2791dfa-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(28,' CCU: RASTREIO','Rastreio do cancro do colo uterino',1,'2010-05-03 11:23:45',0,NULL,NULL,NULL,'e2791f26-1d5f-11e0-b929-000c29ad1d07',NULL,NULL),
(29,'S.TARV: AVALIACAO E PREPARACAO DO CANDIDATO TARV','Avalicao e preparacao psicologica do candidato ao TARV',1,'2011-08-24 08:22:24',0,NULL,NULL,NULL,'f69df47f-44a2-4cca-9819-a536bd47d927',NULL,NULL),
(30,'S.TARV: TERMO DE CONSENTIMENTO DE VISITA','Termo de consentimento de visita domiciliaria/busca activa',1,'2011-08-24 08:28:51',0,NULL,NULL,NULL,'f719006d-dd1f-44cc-b4a0-d25257a8f558',NULL,NULL),
(31,'S.TARV: AVALIACAO DE ADESAO','Avaliacao de adesao para pacientes em TARV',1,'2011-08-24 08:29:41',0,NULL,NULL,NULL,'b2ea993c-cb38-4d48-aade-00e62db9a57e',NULL,NULL),
(32,'S.TARV: LIVRO PRE-TARV','Representa o livro de registo PRE-TARV',1,'2012-02-29 17:05:14',0,NULL,NULL,NULL,'bc30cbe1-85b4-459f-acca-cffc4041a3b8',NULL,NULL),
(33,'S.TARV: LIVRO TARV','Representa o livro de registo TARV',1,'2012-02-29 17:05:40',0,NULL,NULL,NULL,'15915fa8-3d94-430b-9adb-14ec806a8ff2',NULL,NULL),
(34,'APSS: PREVENÇÃO POSITIVA - INICIAL','Avaliação Psico-Social e Prevenção Positiva',1,'2014-04-21 11:18:01',0,NULL,NULL,NULL,'f0bc6401-4e62-43e5-97e2-6ab027bb0405',NULL,NULL),
(35,'APSS: PREVENÇÃO POSITIVA - SEGUIMENTO','Ficha de apoio psicossocial e prevenção positiva - Seguimento',1,'2014-07-09 08:16:00',0,NULL,NULL,NULL,'f4aa93fe-8737-4f70-9532-542b768459d7',NULL,NULL);

