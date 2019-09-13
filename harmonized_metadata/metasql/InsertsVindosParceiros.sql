-- Encounter_Type

INSERT INTO `encounter_type` VALUES (47,'TESTE DE CASO DE ÍNDICE','Patient tested on HIV as index patient',1,'2017-01-17 15:28:44',0,NULL,NULL,NULL,'4f215536-f90d-4e0c-81e1-074047eecd68',NULL,NULL);
INSERT INTO `encounter_type` VALUES (48,'S.TARV: VISITA DE APOIO E REINTEGRACAO - PARTE A','Consulta de dados de visita ao domicilio para apoio e reintegração do paciente',1,'2018-04-12 14:55:18',0,NULL,NULL,NULL,'9d776323-6199-4788-b8e6-5c07f3335ced',NULL,NULL);
INSERT INTO `encounter_type` VALUES (49,'S.TARV: VISITA DE APOIO E REINTEGRACAO - PARTE B','Consulta de dados de visita ao domicilio para apoio e reintegração do paciente',1,'2018-06-04 11:16:51',0,NULL,NULL,NULL,'8284e1e3-e591-4853-996a-ecf4644f9b28',NULL,NULL);
INSERT INTO `encounter_type` VALUES (50,'S.TARV: FICHA DE CHAMADA TELEFONICA','Ficha a ser preenchida antes de se fazer chamada telefonica ao paciente',1,'2018-06-11 12:47:24',0,NULL,NULL,NULL,'36687368-1507-4d36-b492-383edd6d39e1',NULL,NULL);
INSERT INTO `encounter_type` VALUES (51,'FSR - Carga Viral','Ficha de requisição da amostra de carga viral',1,'2019-07-09 11:56:31',0,NULL,NULL,NULL,'b5b7d21f-efd1-407e-81ce-ba9d93c524f8',NULL,NULL);
INSERT INTO `encounter_type` VALUES (52,'Levantamento de ARV Master Card','Registo de levantamento de ARV no Master Card',1,'2019-07-09 13:03:45',0,NULL,NULL,NULL,'cce7b2ec-4fc0-4f9e-806d-b1c4ee9577db',NULL,NULL);
INSERT INTO `encounter_type` VALUES (53,'Master Card - Ficha Resumo','Ficha resumo no master card',1,'2019-07-31 14:23:47',0,NULL,NULL,NULL,'e422ecf9-75dd-4367-b21e-54bccabc4763',NULL,NULL);

-- visit_Type

INSERT INTO `visit_type` VALUES (16,'CHAMADA TELEFONICA','Para registo de chamadas telefonicas aos pacientes','7fefe3bb-de47-41e1-8993-c9bfcdaf3f37',1,'2018-06-11 13:09:55',NULL,NULL,0,NULL,NULL,NULL);
INSERT INTO `visit_type` VALUES (17,'MASTER CARD','Tipo de visita referente as fichas master card','16e8e70e-71a9-4ba7-9138-dfaae88a6969',1,'2019-08-02 08:13:55',NULL,NULL,0,NULL,NULL,NULL);

-- Person_Attributes_Type

INSERT INTO `person_attribute_type` VALUES (27,'givenNameLocal','givenNameLocal','java.lang.String',NULL,0,1,'2015-06-12 11:51:36',NULL,'2016-08-25 14:16:02',1,1,'2016-08-25 14:16:02','Not in use',NULL,'9d38adf9-10e8-11e5-9009-0242ac110012',3);
INSERT INTO `person_attribute_type` VALUES (28,'familyNameLocal','familyNameLocal','java.lang.String',NULL,0,1,'2015-06-12 11:51:36',NULL,'2016-08-25 14:16:10',1,1,'2016-08-25 14:16:10','Not in use',NULL,'9d3a324f-10e8-11e5-9009-0242ac110012',3);
INSERT INTO `person_attribute_type` VALUES (29,'middleNameLocal','middleNameLocal','java.lang.String',NULL,0,1,'2015-06-12 11:51:36',NULL,'2016-08-25 14:21:11',1,1,'2016-08-25 14:16:14','Not in use',NULL,'9d3bbaa1-10e8-11e5-9009-0242ac110012',10);
INSERT INTO `person_attribute_type` VALUES (30,'Numero de Telefone 2',NULL,'java.lang.String',NULL,0,1,'2016-08-25 14:17:34',1,'2016-08-25 14:21:23',0,NULL,NULL,NULL,NULL,'e6c97a9d-a77b-401f-b06e-81900e21ed1d',9);
INSERT INTO `person_attribute_type` VALUES (31,'Ponto de Referência','','java.lang.String',NULL,0,1,'2019-04-03 10:58:40',1,'2019-04-03 10:58:40',0,NULL,NULL,NULL,NULL,'e944813c-11b1-49f3-b9a5-9fbbd10beec2',3);
INSERT INTO `person_attribute_type` VALUES (32,'Sector de Seguimento','Sector do Centro de Saude onde o paciente faz as consultas','java.lang.String',NULL,0,1,'2019-02-07 22:45:26',1,'2019-02-07 22:49:58',0,NULL,NULL,NULL,NULL,'fb088905-cc4e-4085-8a4f-b767b75835a1',13);
INSERT INTO `person_attribute_type` VALUES (33,'Nome do Padrinho','A pessoa que apadrinha o paciente','java.lang.String',NULL,0,1,'2019-02-07 22:51:28',NULL,NULL,0,NULL,NULL,NULL,NULL,'1fe7be94-44e8-42fb-84ec-1551228204d3',14);
INSERT INTO `person_attribute_type` VALUES (34,'Telefone do Padrinho',NULL,'java.lang.String',NULL,0,1,'2019-02-07 23:07:43',NULL,NULL,0,NULL,NULL,NULL,NULL,'ef743dac-75ec-4438-933a-dfcda5c8cd32',15);
INSERT INTO `person_attribute_type` VALUES (35,'Nome do conselheiro Responsavel',NULL,'java.lang.String',NULL,0,1,'2019-02-07 23:13:15',NULL,NULL,0,NULL,NULL,NULL,NULL,'138f4f55-c2de-459a-82fc-f848e2e58525',16);
INSERT INTO `person_attribute_type` VALUES (36,'Telefone do Conselheiro',NULL,'java.lang.String',NULL,0,1,'2019-02-07 23:14:48',NULL,NULL,0,NULL,NULL,NULL,NULL,'8aa651d1-b30c-4426-b98c-e44c05544be0',17);

-- Identifier types

INSERT INTO `patient_identifier_type` VALUES (15,'NID(SERVIÇO TARV-EXT)','Numero de Identificaçao de Doente, serviço TARV Extendido','[0-9]{8}/[0-9]{2}/[0-9]{4}-[A-Z]{1}',0,1,'2016-08-13 12:46:45',0,'PPDDUUSS/AA/NNNNN-L',NULL,0,NULL,NULL,NULL,'127e0ea5-2a4e-4204-90ec-316794da5412',NULL,NULL);


