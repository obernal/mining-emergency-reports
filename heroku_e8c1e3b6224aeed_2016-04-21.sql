# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: us-cdbr-iron-east-03.cleardb.net (MySQL 5.5.45-log)
# Database: heroku_e8c1e3b6224aeed
# Generation Time: 2016-04-21 18:47:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table authorizations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `authorizations`;

CREATE TABLE `authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table banned_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banned_reports`;

CREATE TABLE `banned_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `is_promoted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `ranking`, `is_promoted`)
VALUES
	(1,'crimes','2012-09-24 03:40:23','2012-09-24 03:40:23',0,0),
	(2,'suspected','2012-09-24 03:40:23','2012-09-24 03:40:23',0,0);

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clients`;

CREATE TABLE `clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table crimes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crimes`;

CREATE TABLE `crimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `address` text,
  `latitude` decimal(15,10) DEFAULT NULL,
  `longitude` decimal(15,10) DEFAULT NULL,
  `status` enum('live','banned','protected','deleted') DEFAULT 'live',
  `source_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `pictures_count` int(11) DEFAULT '0',
  `plate` char(8) DEFAULT NULL,
  `report_dt` datetime DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_dt` (`report_dt`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2242 DEFAULT CHARSET=utf8;

LOCK TABLES `crimes` WRITE;
/*!40000 ALTER TABLE `crimes` DISABLE KEYS */;

INSERT INTO `crimes` (`id`, `user_id`, `title`, `description`, `address`, `latitude`, `longitude`, `status`, `source_id`, `subcategory_id`, `created_at`, `updated_at`, `pictures_count`, `plate`, `report_dt`, `client_id`)
VALUES
	(42,NULL,NULL,'favor mandar lo que sea','Troncal Amazónica',-1.9400893594,-77.7282714844,'live',52,4,'2016-04-19 02:08:19','2016-04-19 02:08:19',0,NULL,'2016-04-19 02:08:18',NULL),
	(52,NULL,NULL,'Se necesita agua.','Unnamed Road',0.6059533644,-80.0185775757,'live',62,2,'2016-04-19 02:15:45','2016-04-19 02:15:45',0,NULL,'2016-04-19 02:15:45',NULL),
	(62,NULL,NULL,'Se necesita comida.','Unnamed Road',0.6045801500,-80.0187492371,'live',72,1,'2016-04-19 02:16:58','2016-04-19 02:16:58',0,NULL,'2016-04-19 02:16:58',NULL),
	(72,NULL,NULL,'Se necesita comida.','Unnamed Road',0.6045801500,-80.0187492371,'live',82,1,'2016-04-19 02:16:58','2016-04-19 02:16:58',0,NULL,'2016-04-19 02:16:58',NULL),
	(82,NULL,NULL,'Se necesita ayuda urgentemente!! Nadie ha llegado por allá todavía ya que las vías de las carreteras están derrumbadas. Si hay un estadio en donde los helicópteros pueden llegar. La gente está sin agua, sin luz, sin ayuda alguna! Por favor contáctense con ROGELIO CHEVEZ 0997801940 que es uno de los sobrevivientes en la zona. ','E38',-0.4037442172,-79.9090576172,'live',92,5,'2016-04-19 02:22:47','2016-04-19 02:22:47',0,NULL,'2016-04-19 02:22:47',NULL),
	(92,NULL,NULL,'Rocafuerte necesita de tu ayuda Ecuador. \r\n','30 de Septiembre',-0.9248713314,-80.4542541504,'live',102,4,'2016-04-19 02:28:46','2016-04-19 02:28:46',0,NULL,'2016-04-19 02:28:46',NULL),
	(102,NULL,NULL,'Agua \r\nComida\r\nMedicinas\r\nPlástico\r\nRopa','Unnamed Road',0.3597998813,-80.0051879883,'live',112,1,'2016-04-19 03:20:07','2016-04-19 03:20:07',0,NULL,'2016-04-19 03:20:07',NULL),
	(112,NULL,NULL,'Agua, comida, repelente, aseo personal ','Ruta del Spondylus',0.5582339658,-80.0042438507,'live',122,2,'2016-04-19 03:25:07','2016-04-19 03:25:07',0,NULL,'2016-04-19 03:25:07',NULL),
	(122,NULL,NULL,'Agua\r\nComida \r\nMedicinas\r\nRopa \r\nContacto Daniel 0991883000','Unnamed Road',0.3295880261,-79.9969482422,'live',112,1,'2016-04-19 03:25:37','2016-04-19 03:25:37',0,NULL,'2016-04-19 03:25:37',NULL),
	(152,NULL,NULL,'Agua\r\nMedicinas \r\nAyuda \r\nLeche en polvo\r\nPañales \r\n','Ruta del Spondylus',-0.6188272323,-80.4271316528,'live',132,7,'2016-04-19 03:47:48','2016-04-19 03:47:48',0,NULL,'2016-04-19 03:47:48',NULL),
	(162,NULL,NULL,'Agua enlatados ','Avenida Jama',-0.2010150600,-80.2607917786,'live',142,2,'2016-04-19 04:28:51','2016-04-19 04:28:51',0,NULL,'2016-04-19 04:28:51',NULL),
	(172,NULL,NULL,'Quieres apoyar?\r\nDe una...\r\n\r\nPor favor, acolita con los siguientes productos para enviar a personas de la parroquia de Calderón - Portoviejo.\r\n\r\nPuedes acolitar con.\r\n\r\nMentol\r\nRepelente\r\nComida no perecible ( comida enlatada, granos, arroz, azúcar)\r\nMenticol\r\nUmbral de 500 mg\r\nSuero oral sin sabor \r\nToallas sanitarias\r\nJabón de aseo\r\nPasta dental\r\nAgua en botellones\r\nLinterna\r\nRopa ( para niños y adultos; mujeres y hombres)\r\nPilas\r\nColchones\r\nSábanas\r\nToallas\r\nComida para perros y gatos\r\n\r\nCreo que los productos primordiales son\r\n- AGUA principalmente\r\n -MEDICINAS(alcohol, ibuprofeno, paracetamol, acetaminofen, algodón,  yesos, sueros \r\n-ALIMENTOS (enlatados, atún, fideos, arroz, sardina, frijoles,\r\n-VELAS, TOLDOS, COBIJAS,  (hay muchos mosquitos )\r\n\r\n\r\nAcoliten más información Francisco Palma','E30',-1.0315070000,-80.3394470000,'live',152,2,'2016-04-19 05:00:12','2016-04-19 05:00:12',0,NULL,'2016-04-19 05:00:12',NULL),
	(182,NULL,NULL,'Se necesita agua para consumo. Formol para los cuerpos. Medicamentos para la presion diabetes. Etc. ','Ruta del Spondylus',-0.2087397726,-80.3073120117,'live',162,2,'2016-04-19 05:30:31','2016-04-19 05:30:31',0,NULL,'2016-04-19 05:30:31',NULL),
	(192,NULL,NULL,'No necesitan solo rescate. Necesitan aga, transportación, productos de higiene personal, cobijas, y toda la ayuda de socorristas ','Unnamed Road',0.6083564888,-80.0141143799,'live',182,5,'2016-04-19 13:12:18','2016-04-19 13:12:18',0,NULL,'2016-04-19 13:12:18',NULL),
	(202,NULL,NULL,' tratando de conseguir donaciones para un pueblo de pescadores que se llama san Mateo al sur de manta. Esta igual de afectado que el resto de pueblos pero nadie a ido para allá.','Conector Vía Circunvalación - San Mateo',-0.9611105000,-80.7486145000,'live',192,4,'2016-04-19 13:19:08','2016-04-19 13:19:08',0,NULL,'2016-04-19 13:19:08',NULL),
	(212,NULL,NULL,'Hay escapes de agua ','Unnamed Road',-0.3900116365,-80.1837158203,'live',202,2,'2016-04-19 13:35:11','2016-04-19 13:35:11',0,NULL,'2016-04-19 13:35:11',NULL),
	(222,NULL,NULL,'B','Ruta del Spondylus',-0.0302124009,-80.1507568359,'live',212,2,'2016-04-19 14:08:00','2016-04-19 14:08:00',0,NULL,'2016-04-19 14:08:00',NULL),
	(232,NULL,NULL,'Se necesita agua potable para damnificados del temblor','E38',-0.4047096000,-79.9057063000,'live',222,2,'2016-04-19 14:16:49','2016-04-19 14:16:49',0,NULL,'2016-04-19 14:16:49',NULL),
	(242,NULL,NULL,'Se necesita rescate, agua y medicinas. Siguen cuerpos enterrados bajo los escombros','Avenida Virgilio Ratti',-0.6165957641,-80.4240417480,'live',232,5,'2016-04-19 14:42:18','2016-04-19 14:42:18',0,NULL,'2016-04-19 14:42:18',NULL),
	(252,NULL,NULL,'Se necesita agua','Unnamed Road',0.6094722247,-80.0159597397,'live',32,2,'2016-04-19 15:19:58','2016-04-19 15:19:58',0,NULL,'2016-04-19 15:19:58',NULL),
	(262,NULL,NULL,'Se necesita comida','Unnamed Road',0.3289013919,-80.0009393692,'live',242,1,'2016-04-19 15:21:03','2016-04-19 15:21:03',0,NULL,'2016-04-19 15:21:03',NULL),
	(272,NULL,NULL,'Necesitamos ayuda de todo tipo, principalmente rescatistas y agua, no hay ayuda  en Rocafuerte.\n\nAlex Caamaño\nRescatista','Calle Atahualpa',-0.9283041100,-80.4583740234,'live',32,5,'2016-04-19 15:56:00','2016-04-19 15:56:00',0,NULL,'2016-04-19 15:56:00',NULL),
	(282,NULL,NULL,'60 médicos necesitan transporte desde Quito a zona del desastre. Contacto BELEN SÁNCHEZ 099-980-5556','Antonio de Ulloa',-0.1977535136,-78.4986877441,'live',242,6,'2016-04-19 16:04:14','2016-04-19 16:04:14',0,NULL,'2016-04-19 16:04:13',NULL),
	(292,NULL,NULL,'Agua, toldos, carpas, repelente, comida','E38',-0.3543068239,-79.8321533203,'live',252,7,'2016-04-19 16:08:24','2016-04-19 16:08:24',0,NULL,'2016-04-19 16:08:24',NULL),
	(302,NULL,NULL,'ddddd','VÍA A LA REPRESA DAULE - PERIPA',-0.9887204567,-79.7937011719,'live',262,2,'2016-04-19 16:10:18','2016-04-19 16:10:18',0,NULL,'2016-04-19 16:10:17',NULL),
	(312,NULL,NULL,'xsdzxczxc','E38',-0.3501655715,-79.8389339447,'live',272,1,'2016-04-19 16:12:06','2016-04-19 16:12:06',0,NULL,'2016-04-19 16:12:06',NULL),
	(322,NULL,NULL,'No están recibiendo ayuda, necesitan comida y agua','Ruta del Spondylus',-0.6181406268,-80.4266166687,'live',302,2,'2016-04-19 16:27:25','2016-04-19 16:27:25',0,NULL,'2016-04-19 16:27:25',NULL),
	(332,NULL,NULL,'ESTA MADRUGADA LLEGANDO A COJIMIES\n\n\"Un grupo de hombres con armas blancas, cuchillos, navajas destornilladores, machetes, asaltaron dos camiones cargados de agua entrando a Cojimies. No hay daños físicos. Aproximadamente a las 3-4 de la mañana. Estábamos 5 hombres y yo la única mujer. Me botaron al piso y me manosearon. Se llevaron mis zapatos y las botas\"\n\nTestimonio de amiga que viajó con una guitarra queriendo llegar a espacios de rescate con gente vulnerable, en las zonas en riesgo por el terremoto','Unnamed Road',0.2966295343,-80.0285339355,'live',282,6,'2016-04-19 16:28:42','2016-04-19 16:28:42',0,NULL,'2016-04-19 16:28:42',NULL),
	(342,NULL,NULL,'Se necesita agua en Calceta','E384',-0.8471609414,-80.1638460159,'live',32,2,'2016-04-19 16:29:58','2016-04-19 16:29:58',0,NULL,'2016-04-19 16:29:58',NULL),
	(352,NULL,NULL,'Se necesita agua de urgencia. Gente vendiendo agua a $2 el botella...','Ruta del Spondylus',-0.1847073217,-80.3272247314,'live',322,2,'2016-04-19 16:48:51','2016-04-19 16:48:51',1,NULL,'2016-04-19 16:48:51',NULL),
	(362,NULL,NULL,'INDÍGENAS CHACHI DE ESMERALDAS DESDE LA SELVA CLAMAN AYUDA.SUS CASAS CAYERON AL RIO.CONTACTAR CON SANTIAGO DE LA CRUZ: 0981925564 / 0985568034','Esmeraldas',0.4737370872,-79.3748044968,'live',32,7,'2016-04-19 16:53:16','2016-04-19 16:53:16',0,NULL,'2016-04-19 16:53:16',NULL),
	(372,NULL,NULL,'Ayuda. En la parroquia Abdon Calderón de Portoviejo. Desabastecimiento total viveres y agua. Los camiones no llegan. Autoridades favor su ayuda.','Unnamed Road',-0.8363045310,-80.3526306152,'live',332,1,'2016-04-19 16:56:37','2016-04-19 16:56:37',0,NULL,'2016-04-19 16:56:37',NULL),
	(382,NULL,NULL,'Se necesita Agua para Canoa','Calle Javier Santos',-0.4620859598,-80.4560995102,'live',242,2,'2016-04-19 17:30:27','2016-04-19 17:30:27',1,NULL,'2016-04-19 17:30:27',NULL),
	(392,NULL,NULL,'Se necesita agua para Bahía','Ruta del Spondylus',-0.6541014682,-80.4447269440,'live',32,2,'2016-04-19 17:47:12','2016-04-19 17:47:12',0,NULL,'2016-04-19 17:47:12',NULL),
	(402,NULL,NULL,'En las escuelas al entrar al Carmen se encuentran evacuados por favor necesitan comida y agua, por favor','E38',-0.2636709443,-79.5108032227,'live',352,1,'2016-04-19 18:19:56','2016-04-19 18:19:56',0,NULL,'2016-04-19 18:19:56',NULL),
	(412,NULL,NULL,'Flavio Alfaro necesita agua, ayuda hermanos ecuatorianos','E38',-0.4028001030,-79.9069333076,'live',242,2,'2016-04-19 18:26:03','2016-04-19 18:26:03',0,NULL,'2016-04-19 18:26:03',NULL),
	(422,NULL,NULL,'Se necesita cloro, cepillos de dientes, pasta dental, cloro en sachets, jabón, mascarillas, botas de caucho, pañales y demás artículos de aseo personal.','Avenida 113',-0.9585124166,-80.7131195068,'live',32,4,'2016-04-19 18:45:03','2016-04-19 18:45:03',0,NULL,'2016-04-19 18:45:03',NULL),
	(432,NULL,NULL,'La zona afectada necesita: cloro, cepillos de dientes, pasta dental, cloro en sachets, jabón, mascarillas, botas de caucho, pañales, toallas sanitarias femeninas.','Ruta del Spondylus',-0.6330742763,-80.4281616211,'live',242,4,'2016-04-19 18:46:33','2016-04-19 18:46:33',0,NULL,'2016-04-19 18:46:33',NULL),
	(442,NULL,NULL,'Comida para niños, bebés no tiene pañales, escasez de agua.','San Bolívar - San Domingo',-2.0000000000,-79.4166670000,'live',362,1,'2016-04-19 18:46:47','2016-04-19 18:46:47',0,NULL,'2016-04-19 18:46:47',NULL),
	(452,NULL,NULL,'Por favor enviar mascarillas con filtro, tipo profesional, tipo 3M, para los fuertes olores y que los rescatistas puedan seguir trabajando, alguien que se comunique con 3M y otros fabricantes para que donen','Juan Pereira',0.0736427104,-80.0498628616,'live',372,5,'2016-04-19 18:47:03','2016-04-19 18:47:03',1,NULL,'2016-04-19 18:47:03',NULL),
	(462,NULL,NULL,'Iess de los esteros necesita todo tipo de medicamentos para ayudar a los heridos. \r\nEl patronato municipal también \r\nCloruro de sodio. Analgésicos. Antibióticos, gasas, alcohol, povidin ','Calle 304',-0.9676533000,-80.7089101000,'live',382,4,'2016-04-19 18:47:15','2016-04-19 18:47:15',0,NULL,'2016-04-19 18:47:15',NULL),
	(472,NULL,NULL,'NO TIENEN COMIDA, AGUA, LUZ, AYUDENLOS','Vía a Rocafuerte',-0.7842208000,-80.2343302000,'live',362,1,'2016-04-19 18:49:46','2016-04-19 18:49:46',0,NULL,'2016-04-19 18:49:46',NULL),
	(482,NULL,NULL,'comida','MOISES ARAY',-0.4669137773,-80.4597473145,'live',392,1,'2016-04-19 18:52:00','2016-04-19 18:52:00',0,NULL,'2016-04-19 18:52:00',NULL),
	(492,NULL,NULL,'AYUDA SOLICITADA en la vía Chone Boyacá km 5, poblado de san vicente Boyacá.\n\nEste es una pequeña comunidad a la que no ha llegado ayuda alguna y esta completamente devastada. Por su tamaño una especie de caserío , no esta ni registrada en las actas del país por lo que en un futuro cercano nadie llegará. La persona que trabaja con migo esta ahi desde ayer por lo que les facilito los teléfonos de los directivos del pueblito para coordinar la logística. Espero que los puedan ayudar. :) Gracias de antemano.\n\nNancy Zambrano +593980509070\nDon Vinicio +598980691170\nOscar Vélez +593981291148\n\n','Calle Principal 30 de Marzo',-0.6953402536,-80.1210165024,'live',402,6,'2016-04-19 19:33:44','2016-04-19 19:33:44',0,NULL,'2016-04-19 19:33:44',NULL),
	(502,NULL,NULL,'El pueblo está derrumbado. Llamar a Rogelio Chevez 0997801940 es un sobreviviente esperando un rescate! Gracias! ','E38',-0.4009977029,-79.8994445801,'live',412,5,'2016-04-19 19:45:55','2016-04-19 19:45:55',0,NULL,'2016-04-19 19:45:54',NULL),
	(512,NULL,NULL,'Se necesita agua comida e insumos médicos sobretodo ','Avenida Jama',-0.2020165000,-80.2634774000,'live',422,4,'2016-04-19 19:51:20','2016-04-19 19:51:20',0,NULL,'2016-04-19 19:51:20',NULL),
	(522,NULL,NULL,'Se requiere agua, comida, vestimenta, carpas, colchones.\n(Asociación de Apicultura 25 de Julio - Rocío Pincay 0999198848) ','Unnamed Road',-1.2364107000,-80.6632103000,'live',432,2,'2016-04-19 19:57:54','2016-04-19 19:57:54',1,NULL,'2016-04-19 19:57:54',NULL),
	(532,NULL,NULL,'Necesitamos Agua en botellón para Chone.','Avenida Sixto Durán Ballén',-0.7024207586,-80.0999450684,'live',32,2,'2016-04-19 20:07:42','2016-04-19 20:07:42',0,NULL,'2016-04-19 20:07:42',NULL),
	(542,NULL,NULL,'Agua, alimentos, carpas, colchones, vestido.\n(Cooperativa de Producción Pesquera Artesanal San Francisco de Salinas - telf. Gina Napa 099 1446474)','E383',-0.7645761000,-80.2140053000,'live',432,2,'2016-04-19 20:11:45','2016-04-19 20:11:45',0,NULL,'2016-04-19 20:11:45',NULL),
	(552,NULL,NULL,'Mompiche está incomunicado. Necesitan agua, comida, vestimenta, albergue y medicinas.\n ','Calle de las Iguanas',0.5065553953,-80.0220644474,'live',242,2,'2016-04-19 20:13:36','2016-04-19 20:13:36',0,NULL,'2016-04-19 20:13:36',NULL),
	(562,NULL,NULL,'Carpas, plásticos, agua, alimento y vestido. \n(Asociación Cerro Seco, telf: Marcelo Luque 0994376399)','Ruta del Spondylus',-0.8365619963,-80.4869556427,'live',432,2,'2016-04-19 20:16:03','2016-04-19 20:16:03',0,NULL,'2016-04-19 20:16:03',NULL),
	(572,NULL,NULL,'Agua, alimentos, colchones, sábanas.\n(Comuna San Roque, telf. Bolivar Aragundi 098 9613950','Ruta del Spondylus',-0.8350172076,-80.4877281189,'live',432,2,'2016-04-19 20:19:13','2016-04-19 20:19:13',0,NULL,'2016-04-19 20:19:12',NULL),
	(582,NULL,NULL,'Por favor necesitan agua, comida, medicionas, vestimenta, colchones, cobijas. No hay ayuda todavía y están incomunicados.','Ruta del Spondylus',-0.4621771519,-80.4550856352,'live',242,2,'2016-04-19 20:20:19','2016-04-19 20:20:19',0,NULL,'2016-04-19 20:20:19',NULL),
	(592,NULL,NULL,'Agua, alimentos, carpas, colchones.\n( Unión de Organizaciones Campesinas de San Isidro UOCASI, contacto - Alexandra Leones\n098 440 6777)','Unnamed Road',-1.2962761196,-80.4295349121,'live',432,2,'2016-04-19 20:22:54','2016-04-19 20:22:54',0,NULL,'2016-04-19 20:22:54',NULL),
	(602,NULL,NULL,'Necesitan agua y comida no tienen nada lo han perdido todo','Calle 304',-0.9676533000,-80.7089101000,'live',442,1,'2016-04-19 20:24:52','2016-04-19 20:24:52',0,NULL,'2016-04-19 20:24:52',NULL),
	(612,NULL,NULL,'agua, alimentos, carpas, colchones, sábanas.\n(Comuna Las Gilces - Getrudiz Reyes 098 6511666)','Unnamed Road',-0.8216048000,-80.5230077000,'live',432,2,'2016-04-19 20:25:17','2016-04-19 20:25:17',0,NULL,'2016-04-19 20:25:17',NULL),
	(622,NULL,NULL,'Agua, Enlatados, colchones, vestimenta, medicina. Lo que más escasea es el agua, no tenemos provisiones, no ha llegado la ayuda todavía.','E384',-0.8448008548,-80.1619791985,'live',32,2,'2016-04-19 20:25:28','2016-04-19 20:25:28',0,NULL,'2016-04-19 20:25:28',NULL),
	(632,NULL,NULL,'Nadie ha llegado ayudar todavía a estas personas necesitan principalmente comida medicina, hay gente atrapada que no le pueden sacar porque no saben los daños que existen todavía ','E38',-0.4030575887,-79.8726654053,'live',452,2,'2016-04-19 20:26:06','2016-04-19 20:26:06',0,NULL,'2016-04-19 20:26:06',NULL),
	(642,NULL,NULL,'Necesitan enlatados, bastante agua, medicina, vestimenta, colchones. El dispensario ya no tiene medicinas.','Unnamed Road',0.3652661139,-80.0377768278,'live',32,1,'2016-04-19 20:26:52','2016-04-19 20:26:52',0,NULL,'2016-04-19 20:26:52',NULL),
	(652,NULL,NULL,'Se necesita agua en Botellón para Tosagua','Vía a Rocafuerte',-0.7827086178,-80.2333259583,'live',242,2,'2016-04-19 20:30:08','2016-04-19 20:30:08',0,NULL,'2016-04-19 20:30:08',NULL),
	(662,NULL,NULL,'Es necesario el liquido vital','Ruta del Spondylus',-0.4634806630,-80.4535675049,'live',462,2,'2016-04-19 20:42:09','2016-04-19 20:42:09',0,NULL,'2016-04-19 20:42:09',NULL),
	(672,NULL,NULL,'Están sin agua sin luz sin alimentos hay mucha gente del campo que se han quedado devastecidos completamnete no llega ningún tipo de ayuda por favor!!! Se necesita leche pañales agua sobre todo medicinas!','Vía a Bahía',-0.7717662119,-80.2496337891,'live',472,2,'2016-04-19 20:43:01','2016-04-19 20:43:01',1,NULL,'2016-04-19 20:43:01',NULL),
	(682,NULL,NULL,'Cientos de personas sin agua, comida, medicinas. Hay mucha gente atrapada, prestar atención a zonas alejadas.','E38',-0.4497481889,-79.9948883057,'live',482,2,'2016-04-19 20:43:36','2016-04-19 20:43:36',0,NULL,'2016-04-19 20:43:36',NULL),
	(692,NULL,NULL,'Necesitan agua para beber, están deshidratados\r\n','Sucre',-1.0563442648,-80.4494476318,'live',462,1,'2016-04-19 20:43:38','2016-04-19 20:43:38',0,NULL,'2016-04-19 20:43:38',NULL),
	(702,NULL,NULL,'Necesitan agua para beber, están deshidratados\r\n','Sucre',-1.0563442648,-80.4494476318,'live',462,1,'2016-04-19 20:43:38','2016-04-19 20:43:38',0,NULL,'2016-04-19 20:43:38',NULL),
	(712,NULL,NULL,'Gente de la comunidad sin ningún tipo de ayuda. ','E38',-0.4509497815,-79.9964332581,'live',482,1,'2016-04-19 20:44:59','2016-04-19 20:44:59',0,NULL,'2016-04-19 20:44:59',NULL),
	(722,NULL,NULL,'Muchos heridos y enterrados, nadie llega a socorrerlos. ','E38',-0.4509497815,-79.9945449829,'live',482,5,'2016-04-19 20:45:23','2016-04-19 20:45:23',0,NULL,'2016-04-19 20:45:23',NULL),
	(732,NULL,NULL,'No hay luz dese el día del terremoto se necesita medicinas comida y agua ','Antiguo',-0.7827515291,-80.2304077148,'live',492,1,'2016-04-19 20:45:41','2016-04-19 20:45:41',0,NULL,'2016-04-19 20:45:41',NULL),
	(742,NULL,NULL,'No les llega ninguna ayuda xfavor hagan q las donaciones llegan han perdido todo necesitan agua comida','Calle 305',-0.9675501842,-80.7081654668,'live',442,2,'2016-04-19 20:46:11','2016-04-19 20:46:11',0,NULL,'2016-04-19 20:46:11',NULL),
	(752,NULL,NULL,'Casi 100% destruído','Calle Santa Martha',-0.7000176793,-80.0994300842,'live',482,7,'2016-04-19 20:46:12','2016-04-19 20:46:12',0,NULL,'2016-04-19 20:46:12',NULL),
	(762,NULL,NULL,'Se necesita artículos de aseo personal','Federico Páez',-0.7845430771,-80.2349030972,'live',242,4,'2016-04-19 20:47:01','2016-04-19 20:47:01',0,NULL,'2016-04-19 20:47:00',NULL),
	(772,NULL,NULL,'Se requiere artículos de aseo como: cloro en sachets, jabones, alcohol, por favor ayuda','Ruta del Spondylus',0.0731277267,-80.0451421738,'live',242,4,'2016-04-19 20:53:09','2016-04-19 20:53:09',0,NULL,'2016-04-19 20:53:09',NULL),
	(782,NULL,NULL,'No les ha llegdo nigun tipo de ayuda  necesitan hidratarse y comer es urgente ayuden ','Avenida 215',-0.9812435630,-80.7059419155,'live',442,2,'2016-04-19 20:55:53','2016-04-19 20:55:53',0,NULL,'2016-04-19 20:55:53',NULL),
	(792,NULL,NULL,'Se necesita comida, se esta acabando todo.','E384',-0.9173192069,-80.1727294922,'live',502,1,'2016-04-19 20:56:36','2016-04-19 20:56:36',0,NULL,'2016-04-19 20:56:36',NULL),
	(802,NULL,NULL,'Urgente, se solicita ayuda con alimentos no perecibles y agua','Malecón',-0.8629949399,-80.5340766907,'live',242,1,'2016-04-19 20:57:29','2016-04-19 20:57:29',0,NULL,'2016-04-19 20:57:29',NULL),
	(812,NULL,NULL,'Se necesita comida agua, rescate, comida y medicinas ','E39',-0.9249142412,-80.4513359070,'live',512,5,'2016-04-19 21:02:42','2016-04-19 21:02:42',0,NULL,'2016-04-19 21:02:42',NULL),
	(822,NULL,NULL,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text e','Calceta - Via Quiroga - Pichincha',-0.9502738136,-80.0354003906,'live',242,3,'2016-04-19 21:09:14','2016-04-19 21:09:14',0,NULL,'2016-04-19 21:09:14',NULL),
	(832,NULL,NULL,'Se necesita agua en botellones y tanques para almacenarla.','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',32,1,'2016-04-19 21:38:14','2016-04-19 21:38:14',1,NULL,'2016-04-19 21:38:14',NULL),
	(842,NULL,NULL,'Se necesita agua en botellones y tanques para almacenarla.','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',242,2,'2016-04-19 21:41:06','2016-04-19 21:41:06',1,NULL,'2016-04-19 21:41:06',NULL),
	(852,NULL,NULL,'Se necesita agua embotellada y tanques para almacenar agua de tanqueros.','Ruta del Spondylus',-0.6543589435,-80.4192352295,'live',32,2,'2016-04-19 21:44:34','2016-04-19 21:44:34',1,NULL,'2016-04-19 21:44:34',NULL),
	(862,NULL,NULL,'Medicinas ','Ruta del Spondylus',0.0521850514,-80.0381469727,'live',522,4,'2016-04-19 21:45:00','2016-04-19 21:45:00',0,NULL,'2016-04-19 21:44:59',NULL),
	(872,NULL,NULL,'Medicinas ','Ruta del Spondylus',0.0521850514,-80.0381469727,'live',522,4,'2016-04-19 21:45:00','2016-04-19 21:45:00',0,NULL,'2016-04-19 21:44:59',NULL),
	(882,NULL,NULL,'Es importante la ayuda que necesita es Agua y también tanques para poder almacenarla cuando pasa el tanquero.','E482',-1.0459390451,-80.6589603424,'live',242,2,'2016-04-19 22:06:18','2016-04-19 22:06:18',0,NULL,'2016-04-19 22:06:18',NULL),
	(892,NULL,NULL,'Se requiere Agua en San Vicente, ayuda con el vital elemento.','Bahia De Caraquez Airport',-0.6077987000,-80.4028416000,'live',32,2,'2016-04-19 22:10:15','2016-04-19 22:10:15',0,NULL,'2016-04-19 22:10:15',NULL),
	(902,NULL,NULL,'Se necesita ayuda en diversos recintos de Flavio Alfaro, comida y  agua, por favor contamos con su ayuda.','E38',-0.4033150744,-79.9116647243,'live',32,1,'2016-04-19 22:23:05','2016-04-19 22:23:05',0,NULL,'2016-04-19 22:23:05',NULL),
	(912,NULL,NULL,'También se necesita alimento para mascotas en Cojimíes, ayuda por favor','Unnamed Road',0.3639671000,-80.0374246000,'live',242,1,'2016-04-19 22:29:11','2016-04-19 22:29:11',0,NULL,'2016-04-19 22:29:11',NULL),
	(922,NULL,NULL,'Necesitan, agua, alimentos enlatados, suministros de aseo personal, platos plasticos, fundas de basura industrial, vestimenta.\n\nLa comida escasea y hay mucho robo de viveres, las donaciones que van estan en peligro de asaltantes','Avenida Olmedo',-1.0549390258,-80.4523457587,'live',242,2,'2016-04-19 22:45:06','2016-04-19 22:45:06',0,NULL,'2016-04-19 22:45:06',NULL),
	(932,NULL,NULL,'Necesitan agua, alimentos enlatados, suministros de aseo personal, platos plasticos, fundas de basura industrial, colchones, vestimenta. La persona de contacto es David Gutierrez -  0994866416\n\nla comida escasea y hay mucho robo de viveres, las donaciones que van no llegan porque los asaltantes no lo permiten','Avenida Olmedo',-1.0547230000,-80.4524903000,'live',242,2,'2016-04-19 22:51:12','2016-04-19 22:51:12',0,NULL,'2016-04-19 22:51:12',NULL),
	(942,NULL,NULL,'El poblado \'Mono Chibunga\', Vía Pedernales km 44 y medio  En la mitad de la vía El Carmen/Pedernales. Hay un rótulo a lado izquierdo que dice Chibunga. Se necesita ayuda con comida, agua y otras cosas también.\nContactos: Danilo Loor 097 918 6699','E382',-0.0810241429,-79.7286415100,'live',32,1,'2016-04-19 22:51:41','2016-04-19 22:51:41',0,NULL,'2016-04-19 22:51:41',NULL),
	(952,NULL,NULL,'Por favor en este lugar necesitan de toda la ayuda ya que solo se estan preocupando por pedernales otros lugares de igual manera necesitan ayuda por favor yo se q pedernales es el mas afectado pero un poquito de ayuda no biene mal a este lugar muchisimas gracias que Dios les pague ','E39',-0.9954754000,-80.4173514000,'live',532,5,'2016-04-19 22:51:50','2016-04-19 22:51:50',0,NULL,'2016-04-19 22:51:50',NULL),
	(962,NULL,NULL,'PLAYA PRIETA necesita de su ayuda con comida y agua, Queda via a Pueblo Nuevo a 15 min de Portoviejo Hay una gruta de Virgen en la carretera a mano izquierda por ahí es la entrada pero si llaman a Bryan él puede salir con gente a esperarlos!\nContactos: BRYAN ALAVA BRAVO 096 723 8689 ','E30',-1.0362632326,-80.4118537903,'live',32,1,'2016-04-19 22:56:41','2016-04-19 22:56:41',0,NULL,'2016-04-19 22:56:41',NULL),
	(972,NULL,NULL,'Rocafuerte-Manabi necesita ayuda con alimentos, agua. Queda a una hora de Chone via a Poroviejo Se  llega a chone se sigue como para ir hasta portoviejo.\nContactos: CLARA JUDITH ZAMBRANO 098 801 0877','Calle José María Huerta',-0.9221251062,-80.4473876953,'live',32,1,'2016-04-19 23:18:29','2016-04-19 23:18:29',0,NULL,'2016-04-19 23:18:29',NULL),
	(982,NULL,NULL,'PLAYA PRIETA necesita de su ayuda con comida y agua, Queda via a Pueblo Nuevo a 15 min de Portoviejo Hay una gruta de Virgen en la carretera a mano izquierda por ahí es la entrada pero si llaman a Bryan él puede salir con gente a esperarlos!\nContactos: BRYAN ALAVA BRAVO 096 723 8689 ','E384',-0.9682957319,-80.2867126465,'live',242,1,'2016-04-19 23:19:58','2016-04-19 23:19:58',0,NULL,'2016-04-19 23:19:58',NULL),
	(992,NULL,NULL,'Ayuda para San Agustín A 20 kilómetros de Bahía.  De Bahía 15 a 20 minutos, necesitan agua y comida.\nContactos: Patricia Constante  099 821 2502','Ruta del Spondylus',-0.6507542884,-80.4191493988,'live',242,1,'2016-04-19 23:22:54','2016-04-19 23:22:54',0,NULL,'2016-04-19 23:22:54',NULL),
	(1002,NULL,NULL,'Provisiones y rescate ','Waz White',-1.8275403752,-80.7460784912,'live',542,2,'2016-04-19 23:26:52','2016-04-19 23:26:52',0,NULL,'2016-04-19 23:26:52',NULL),
	(1012,NULL,NULL,'Agua comida y rescate','Unnamed Road',-1.0272524714,-80.3638744354,'live',552,1,'2016-04-20 00:23:34','2016-04-20 00:23:34',0,NULL,'2016-04-20 00:23:34',NULL),
	(1022,NULL,NULL,'Agua','Unnamed Road',0.1544950520,-80.0237274170,'live',562,2,'2016-04-20 00:32:11','2016-04-20 00:32:11',0,NULL,'2016-04-20 00:32:11',NULL),
	(1032,NULL,NULL,'Agua','Unnamed Road',0.1544950520,-80.0237274170,'live',562,2,'2016-04-20 00:32:11','2016-04-20 00:32:11',0,NULL,'2016-04-20 00:32:11',NULL),
	(1042,NULL,NULL,'Agua y comida (víveres)','225',-1.0574169659,-80.4520547390,'live',572,2,'2016-04-20 01:16:00','2016-04-20 01:16:00',0,NULL,'2016-04-20 01:16:00',NULL),
	(1052,NULL,NULL,'Agua y comida (víveres)','225',-1.0574169659,-80.4520547390,'live',582,2,'2016-04-20 01:16:00','2016-04-20 01:16:00',0,NULL,'2016-04-20 01:16:00',NULL),
	(1062,NULL,NULL,'Comida ,agua','Unnamed Road',-0.4083308471,-80.1599029591,'live',592,1,'2016-04-20 01:28:49','2016-04-20 01:28:49',0,NULL,'2016-04-20 01:28:49',NULL),
	(1072,NULL,NULL,'Se requiere ayuda porque los caminos están destruidos y toma mucho tiempo llegar. Quizás helicópteros o algún mecanismo para llegar a pequeñas poblaciones con problemas de acceso. ','Ruta del Spondylus',-0.2279657071,-80.2688598633,'live',602,4,'2016-04-20 01:51:09','2016-04-20 01:51:09',0,NULL,'2016-04-20 01:51:09',NULL),
	(1082,NULL,NULL,'Se requiere ayuda porque los caminos están destruidos y toma mucho tiempo llegar. Quizás helicópteros o algún mecanismo para llegar a pequeñas poblaciones con problemas de acceso. ','Ruta del Spondylus',-0.2279657071,-80.2688598633,'live',602,4,'2016-04-20 01:51:09','2016-04-20 01:51:09',0,NULL,'2016-04-20 01:51:09',NULL),
	(1092,NULL,NULL,'Doctores','Ruta del Spondylus',-0.6509259387,-80.4254150391,'live',612,4,'2016-04-20 01:58:38','2016-04-20 01:58:38',0,NULL,'2016-04-20 01:58:38',NULL),
	(1102,NULL,NULL,'Por dios manden rescatadas!!!! ','Ruta del Spondylus',-0.4637769000,-80.4535121000,'live',632,5,'2016-04-20 03:16:59','2016-04-20 03:16:59',0,NULL,'2016-04-20 03:16:59',NULL),
	(1112,NULL,NULL,'Se necesita agua de urgencia es lo primordial ','Unnamed Road',0.6042368464,-80.0340270996,'live',642,2,'2016-04-20 03:53:15','2016-04-20 03:53:15',0,NULL,'2016-04-20 03:53:15',NULL),
	(1122,NULL,NULL,'Enlatados','Ruta del Spondylus',-0.1922603814,-80.2880859375,'live',652,1,'2016-04-20 04:18:59','2016-04-20 04:18:59',0,NULL,'2016-04-20 04:18:59',NULL),
	(1162,NULL,NULL,'Rescatistas','Ruta del Spondylus',0.1483152640,-79.9804687500,'live',692,5,'2016-04-20 11:51:50','2016-04-20 11:51:50',0,NULL,'2016-04-20 11:51:50',NULL),
	(1172,NULL,NULL,'Rescatistas','Ruta del Spondylus',0.1483152640,-79.9804687500,'live',692,5,'2016-04-20 11:51:50','2016-04-20 11:51:50',0,NULL,'2016-04-20 11:51:50',NULL),
	(1182,NULL,NULL,'Rescatistas','Ruta del Spondylus',0.1483152640,-79.9804687500,'live',692,5,'2016-04-20 11:51:50','2016-04-20 11:51:50',0,NULL,'2016-04-20 11:51:50',NULL),
	(1192,NULL,NULL,'Rescatistas','Ruta del Spondylus',0.1483152640,-79.9804687500,'live',692,5,'2016-04-20 11:51:50','2016-04-20 11:51:50',0,NULL,'2016-04-20 11:51:50',NULL),
	(1202,NULL,NULL,'Tengo amigos haya que Asus casas  se han caído y asín no llega ninguna ayuda necesitan agua alimento medicinas porfavor ayudemos\r\n','E383A',-0.6037218909,-80.4022407532,'live',702,1,'2016-04-20 12:18:32','2016-04-20 12:18:32',0,NULL,'2016-04-20 12:18:32',NULL),
	(1212,NULL,NULL,'En Don Juan necesitan agua, comida, medicinas para enfermedades crónicas, hiper tensión, diabetes, jarabes para la tos en niños. \r\nJuguetes, sabanas.\r\nNo más ropa.\r\nVoluntarios organizaron a la población en la escuela Son Juan. \r\nNo tienen luz. ','Ruta del Spondylus',-0.1434229307,-80.2388191223,'live',712,4,'2016-04-20 12:24:13','2016-04-20 12:24:13',0,NULL,'2016-04-20 12:24:13',NULL),
	(1222,NULL,NULL,'Me comentan q Jama necesita OLLAS para poder cocinar!! ','Ruta del Spondylus',-0.2114863362,-80.2578735352,'live',722,1,'2016-04-20 13:19:38','2016-04-20 13:19:38',0,NULL,'2016-04-20 13:19:38',NULL),
	(1232,NULL,NULL,'Ayuda para Coaque se necesita viveres y agua,  por troncal del pacifico o ruta spondylus   despues de lkilometro 15 tomar desviacion a la derecha.\n\nContacto: Sofia Galeas  098 030 5694','Ruta del Spondylus',0.0000000000,-80.1000000000,'live',32,1,'2016-04-20 14:23:39','2016-04-20 14:23:39',0,NULL,'2016-04-20 14:23:39',NULL),
	(1242,NULL,NULL,'Ayuda para Jama por favor, se necesita viveres y agua. \nContacto: Lic Lenny Estacio 098 352 8290','Avenida Jama',-0.2029891536,-80.2623367310,'live',32,2,'2016-04-20 14:31:17','2016-04-20 14:31:17',0,NULL,'2016-04-20 14:31:17',NULL),
	(1252,NULL,NULL,'Ayuda para Bahia de caraquez, necesitan comida y agua.\nContacto: Rommel García   098 505 3285 ','Ruta del Spondylus',-0.6220886072,-80.4267883301,'live',242,1,'2016-04-20 14:33:23','2016-04-20 14:33:23',0,NULL,'2016-04-20 14:33:23',NULL),
	(1262,NULL,NULL,'Ayuda en el Hospital Baca Ortiz llegaron algunos niños desde Pedernales, Jama, Manta etc. Y tenemos albergados a 40 personas que vinieron con ellos, necesitamos alimentación o fondos para alimentarles desde la próxima semana.\n\nCualquier duda por favor comuníquese al 099 758 6901 con María Belén Rodríguez.','Avenida Cristóbal Colón',-0.2023668850,-78.4862422943,'live',242,1,'2016-04-20 14:48:47','2016-04-20 14:48:47',0,NULL,'2016-04-20 14:48:47',NULL),
	(1272,NULL,NULL,'AYUDA URGENTE Amigos Necesitamos su apoyo, hay 150 personas en Una finca privada que fue abierta por sus dueños para poder albergar a gente que perdió todo, están quedándose sin insumos sin agua y la ayuda no llega ahí porque está ubicada en PUERTO ESCONDIDO 15 km antes de la entrada a Pedernales vía El Carmen, si conocen de equipos o brigadas oficiales que puedan acercarse con donaciones para éstas personas infórmenme de inmediato les envío el contacto ¡COMPARTAN, ENVÍEN A GENTE QUE PUEDA AYUDAR POR FAVOR!\n\nInfo con Maru Donoso al +593 98 466 1904','E382',-0.0830840773,-79.6982574463,'live',32,1,'2016-04-20 14:54:20','2016-04-20 14:54:20',0,NULL,'2016-04-20 14:54:20',NULL),
	(1282,NULL,NULL,'El Pueblito de Rocafuerte ubicado vía Crucita, comida, agua, vestimenta, medicinas','Via Portoviejo Crucita',-0.9114405534,-80.4931783676,'live',732,1,'2016-04-20 14:55:47','2016-04-20 14:55:47',0,NULL,'2016-04-20 14:55:47',NULL),
	(1292,NULL,NULL,'Ayuda para 30 niños que han quedado huerfanos se necesita alimentos en general, ropa de niños y niñas, sábanas cobijas.\n\nContacto: Nancy Salazar 099 562 3208 (Asociación Solidaridad y Acción)\nhttp://www.asosolac.org/','Francisco Sánchez',-0.0868391658,-78.4702992439,'live',242,1,'2016-04-20 15:05:59','2016-04-20 15:05:59',0,NULL,'2016-04-20 15:05:59',NULL),
	(1302,NULL,NULL,'Arquitectos o Ingenieros Civiles que puedan ayudar contáctense por favor.\nPNUD (ONU) y MIDUVI necesitan 250 voluntarios INGENIEROS CIVILES y ARQUITECTOS con disponibilidad de desplazamiento por 3 días a las Zonas afectadas por el terremoto, los voluntarios serán capacitados, transportados, y tendrán espacio para acampar.\n\nContacto: actuemosecuador@gmail.com\nFormulario de Registro: http://bitly.com/actuemosecuador','Avenue 12 De Octubre',-0.2097053614,-78.4922289848,'live',32,5,'2016-04-20 15:28:58','2016-04-20 15:28:58',0,NULL,'2016-04-20 15:28:58',NULL),
	(1312,NULL,NULL,'Todo tipo de alimentos, víveres y agua','Unnamed Road',0.2746142364,-79.9538612366,'live',742,1,'2016-04-20 15:33:48','2016-04-20 15:33:48',0,NULL,'2016-04-20 15:33:48',NULL),
	(1322,NULL,NULL,'Se necesitan carpas y toldos para Junin\nGracias por la ayuda','E384',-0.9277434000,-80.2070328000,'live',242,3,'2016-04-20 16:06:16','2016-04-20 16:06:16',0,NULL,'2016-04-20 16:06:16',NULL),
	(1332,NULL,NULL,'Agua pañales y comida','Calle America',-1.0482775408,-80.6587028503,'live',752,2,'2016-04-20 16:11:05','2016-04-20 16:11:05',0,NULL,'2016-04-20 16:11:05',NULL),
	(1342,NULL,NULL,'URGENTE SE NECESITAN APROX 28 CAMIONES PARA TRANSPORTAR 2,000 COLCHONES DESDE LATACUNGA! \n\nCONTACTAR A LUIS MIGUEL DIAZ 099 966 0669','Calle Jaime Roldos Aguilera',-0.9195505181,-78.6212539673,'live',32,6,'2016-04-20 16:16:27','2016-04-20 16:16:27',0,NULL,'2016-04-20 16:16:27',NULL),
	(1352,NULL,NULL,'URGENTE: La ayuda no llega a Bahia de Caraquez. Se necesita, agua, viveres, implementos de aseo, medicinas. Contactar a GUSTAVO HIDALGO: 0939957575','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',32,2,'2016-04-20 16:16:40','2016-04-20 16:16:40',0,NULL,'2016-04-20 16:16:40',NULL),
	(1362,NULL,NULL,'URGENTE: En atacames de necesita viveres en mucha cantidad, agua. Contactar a LUIS PEREA:  0980324820','Unnamed Road',0.8690453123,-79.8477745056,'live',242,1,'2016-04-20 16:20:09','2016-04-20 16:20:09',0,NULL,'2016-04-20 16:20:09',NULL),
	(1372,NULL,NULL,'Se necesita gente voluntaria para clasificar agua y comida.','Unnamed Road',0.3570533530,-80.0326538086,'live',772,2,'2016-04-20 16:25:27','2016-04-20 16:25:27',1,NULL,'2016-04-20 16:25:27',NULL),
	(1382,NULL,NULL,'Se necesita ayuda de comida y agua para Canuto, gracias por su apoyo.','E384',-0.7971863000,-80.1275052000,'live',32,1,'2016-04-20 16:30:07','2016-04-20 16:30:07',0,NULL,'2016-04-20 16:30:07',NULL),
	(1392,NULL,NULL,'Enviar ayuda para San Isidro, comida, agua, medicinas.\n\nDios recompensara su generosidad.','Unnamed Road',-0.3763083000,-80.1847167000,'live',242,1,'2016-04-20 16:35:37','2016-04-20 16:35:37',0,NULL,'2016-04-20 16:35:37',NULL),
	(1402,NULL,NULL,'Ayuda en los Ranchos de Crucita.\n\nAgua, alimento, medicinas, carpas, toldos.\n ','Unnamed Road',-0.8494781160,-80.5310726166,'live',32,1,'2016-04-20 16:38:35','2016-04-20 16:38:35',0,NULL,'2016-04-20 16:38:35',NULL),
	(1412,NULL,NULL,'En los Arenales de Crucita necesitan de ayuda con agua, alimento, carpas, toldos.','Malecón',-0.8569874685,-80.5327033997,'live',242,2,'2016-04-20 16:40:19','2016-04-20 16:40:19',0,NULL,'2016-04-20 16:40:19',NULL),
	(1422,NULL,NULL,'tambien se necesita alimentacion en la parroquia 10 de agosto canton sucre san isidro recinto san josé hay casa caidas y personas fallecidas ','Ruta del Spondylus',-0.6221181098,-80.4288750887,'live',782,2,'2016-04-20 16:42:04','2016-04-20 16:42:04',0,NULL,'2016-04-20 16:42:04',NULL),
	(1432,NULL,NULL,'Zona Rural Tomal/ dentro de la Parroquia Rio Chico, Manabi Porviejo\nEn una casa se Encuentran 5 familias, en todo el pueblo hay al rededor de 50 familias','E39',-0.9954754000,-80.4173514000,'live',792,1,'2016-04-20 16:53:36','2016-04-20 16:53:36',0,NULL,'2016-04-20 16:53:36',NULL),
	(1442,NULL,NULL,'QUE NO LES  ENTREGAN ALIMENTOS, AGUA  Y SI HAY   CONTACTO SARA UBILLUS  098486699','Avenida Olmedo',-1.0547230000,-80.4524903000,'live',802,4,'2016-04-20 17:00:25','2016-04-20 17:00:25',0,NULL,'2016-04-20 17:00:25',NULL),
	(1452,NULL,NULL,'Sigan enviando ayuda para Rocafuerte, gracias por la ayuda amigos y hermanos ecuatorianos.','Callejón Claudio García',-0.9217389181,-80.4498767853,'live',32,1,'2016-04-20 17:03:09','2016-04-20 17:03:09',0,NULL,'2016-04-20 17:03:09',NULL),
	(1462,NULL,NULL,'Amigos estoy trabajando en el centro de salu de cojimies . \n\nHay un equipo buenísimo de médicos dee hospital metropolitano de Quito . Recién habilitamos el hospital y aun no hay pacientes . Favor ayuden a difundir que si nessesitan atención médica o cicologica venir a cojimies .','Unnamed Road',0.3650998203,-80.0379109383,'live',32,5,'2016-04-20 17:24:13','2016-04-20 17:24:13',0,NULL,'2016-04-20 17:24:13',NULL),
	(1472,NULL,NULL,'Amigos hoy el Hospital Baca Ortiz necesita nuestra ayuda, está llegando mucha gente que no tiene nada y no se abastecen, lo que más necesitan son colchones sobre todo y gente que ayude con donaciones, desayunos, etc. las voluntarias se están turnando para ir a atenderles pero no se dan abasto.\n\nPor favor comunicarse con la Presidenta de las Voluntarias de dicho hospital la \n\nSra. Lalita de Espinoza cel: 099 980 0010','Avenida Cristóbal Colón',-0.2024688083,-78.4863173962,'live',32,7,'2016-04-20 17:27:10','2016-04-20 17:27:10',0,NULL,'2016-04-20 17:27:10',NULL),
	(1482,NULL,NULL,'Se necesitan 250 voluntarios Ingenieros y Arquitectos con disponibilidad de desplazamiento a zonas afectadas por 3 días, los voluntarios serán capacitados, transportados, y tendrán espacio para acampar.\n\nNecesitamos respuestas inmediatas a actuemosecuador@gmail.com	','Pedernales',0.0719046404,-80.0524592400,'live',242,5,'2016-04-20 17:43:33','2016-04-20 17:43:33',0,NULL,'2016-04-20 17:43:33',NULL),
	(1492,NULL,NULL,'Equipado y listo para recibir pacientes. Ayuda médica y sicológica.','Unnamed Road',0.3653894930,-80.0373530388,'live',242,4,'2016-04-20 17:43:58','2016-04-20 17:43:58',0,NULL,'2016-04-20 17:43:58',NULL),
	(1502,NULL,NULL,'#SismoEcuador Anoche nos llegó una gran idea para ayudar en a las personas afectadas por el Terremoto que aconteció en Ecuador. Como muchos saben se están pidiendo donativos de comida, medicinas, ropa, agua, etc, pero lo más dificil de conseguir son carpas. Es posible que muchas personas tengan sus carpas personales de Campus Party - Ecuador perdidas en el olvido de algún armario y esas pequeñas carpas pueden marcar la diferencia. Si tienen alguna de dichas carpas por favor donenla en cualquiera de los puntos en su ciudad. Gracias a todos! #GamersUnidos (Gracias Charbel Alexander por la gran idea)','Ruta del Spondylus',-0.4645964253,-80.4529666901,'live',32,7,'2016-04-20 17:48:25','2016-04-20 17:48:25',1,NULL,'2016-04-20 17:48:25',NULL),
	(1512,NULL,NULL,'0996831142 Traslados de emergencia, helicóptero de la Policía con base en Manta','Calle 304',-0.9676533000,-80.7089101000,'live',812,5,'2016-04-20 17:50:58','2016-04-20 17:50:58',0,NULL,'2016-04-20 17:50:58',NULL),
	(1522,NULL,NULL,'Evacuación emergente de Manta a Gye por helicóptero 0984057678','Calle 304',-0.9676533000,-80.7089101000,'live',812,5,'2016-04-20 18:03:37','2016-04-20 18:03:37',0,NULL,'2016-04-20 18:03:37',NULL),
	(1532,NULL,NULL,'Este el sitio que reportó un geógrafo acerca de las vías habilitadas, puede ser de utilidad para el que esté viajando.\n\nhttp://bit.ly/vias-habilitadas-ec','Calle Hermogenes',-1.0621797542,-80.4336547852,'live',242,6,'2016-04-20 18:10:51','2016-04-20 18:10:51',0,NULL,'2016-04-20 18:10:51',NULL),
	(1542,NULL,NULL,'Ayuda en Portoviejo, calle Santa Ana y México (Por el Shopping, parque del niño), necesidad urgente de Agua y Alimentos','México',-1.0592512839,-80.4670643806,'live',32,2,'2016-04-20 18:17:37','2016-04-20 18:17:37',0,NULL,'2016-04-20 18:17:37',NULL),
	(1552,NULL,NULL,'Un amigo que tiene familia en jaramijo-manta me dice que allá no tienen luz ni agua. Y que la tienda de abastecimiento de víveres se derrumbó. Envíen las donaciones también allá por favor. Además dicen que los muertos ya están oliendo mal','23 de Octubre',-0.9560251000,-80.6384944000,'live',822,1,'2016-04-20 18:52:39','2016-04-20 18:52:39',1,NULL,'2016-04-20 18:52:39',NULL),
	(1562,NULL,NULL,'Se necesitan baños portatiles en Manabi, Canoa, Jama y Manta\ncontacto: Lourdes 0986193931','Calle 319',-0.9777357462,-80.7055664063,'live',832,5,'2016-04-20 19:00:18','2016-04-20 19:00:18',0,NULL,'2016-04-20 19:00:17',NULL),
	(1572,NULL,NULL,'Pañales agua comida','Calle America',-1.0478270051,-80.6591695547,'live',752,1,'2016-04-20 19:15:36','2016-04-20 19:15:36',0,NULL,'2016-04-20 19:15:36',NULL),
	(1582,NULL,NULL,'Se necesita donación de sábanas para Chamanga','Ruta del Spondylus',0.2666670000,-79.9333330000,'live',242,3,'2016-04-20 19:29:25','2016-04-20 19:29:25',1,NULL,'2016-04-20 19:29:25',NULL),
	(1592,NULL,NULL,'Los recintos: \nLa Piquigua, Barreto, La Mocora, Bijagual, Colorado, Tigrillo y La Papaya pertenecientes a Jama no han sido atendidos todavía.En el mapa q les envio a continuacion se puede ver la ubicacion de los 5 primeros, los dos últimos no constan en el mapa.','Avenida Jama',-0.1912304189,-80.2623367310,'live',242,1,'2016-04-20 19:40:54','2016-04-20 19:40:54',0,NULL,'2016-04-20 19:40:54',NULL),
	(1602,NULL,NULL,'Prueba Daphné','70',-2.1747705722,-79.9145507813,'live',832,3,'2016-04-20 19:44:24','2016-04-20 19:44:24',0,NULL,'2016-04-20 19:44:24',NULL),
	(1612,NULL,NULL,'Por favor, no nos olvidemos de los perros rescatistas, necesitan BOTAS ESPECIALES o VENDAS ELASTICAS #EcuadorSolidario #TerremotoEcuador #SeNecesitaEC','Juan Pereira',0.0756168146,-80.0465154648,'live',242,5,'2016-04-20 20:10:29','2016-04-20 20:10:29',1,NULL,'2016-04-20 20:10:28',NULL),
	(1622,NULL,NULL,'Se necesita VOLUNTARIOS para armar casas prefabricadas. \nContactos 099 802 9929','E382',0.0701665703,-80.0447988510,'live',242,7,'2016-04-20 20:13:23','2016-04-20 20:13:23',0,NULL,'2016-04-20 20:13:23',NULL),
	(1632,NULL,NULL,'@friega_again En Calceta necesitan ayuda y no han sido tan atendidos...','Via Tosagua - Calceta',-0.8422691239,-80.1634812355,'live',32,1,'2016-04-20 20:20:13','2016-04-20 20:20:13',0,NULL,'2016-04-20 20:20:13',NULL),
	(1642,NULL,NULL,'#AyudaEc #SeNecesitaEC InfoVerificada. Rescate URG.  Requerimos 2 camiones, 3 médicos, militares, agua. hablar con Ricardo Garzón 099 901 6737','Ruta del Spondylus',-0.6632847450,-80.4240417480,'live',242,6,'2016-04-20 20:28:27','2016-04-20 20:28:27',0,NULL,'2016-04-20 20:28:27',NULL),
	(1652,NULL,NULL,'Universidad Santa María... Se informa a los VOLUNTARIOS que quieran unirse a la construcción de Ataúdes emergentes pueden confirmar su asistencia en:\n\n099 497 5878 / comunicacion@usm.edu.ec','Avenue Carlos Julio Arosemena Tola',-2.1644782732,-79.9245071411,'live',242,5,'2016-04-20 20:46:15','2016-04-20 20:46:15',0,NULL,'2016-04-20 20:46:15',NULL),
	(1662,NULL,NULL,'Universidad Santa María... Se informa a los VOLUNTARIOS que quieran unirse a la construcción de Ataúdes emergentes pueden confirmar su asistencia en:\n\n099 497 5878 / comunicacion@usm.edu.ec','Avenue Carlos Julio Arosemena Tola',-2.1647784662,-79.9251616001,'live',242,5,'2016-04-20 20:50:16','2016-04-20 20:50:16',1,NULL,'2016-04-20 20:50:16',NULL),
	(1672,NULL,NULL,'Se necesita agua, comida, no llega ayuda. Por favor.','Vía a Rocafuerte',-0.7842208000,-80.2343302000,'live',292,2,'2016-04-20 20:53:05','2016-04-20 20:53:05',0,NULL,'2016-04-20 20:53:05',NULL),
	(1682,NULL,NULL,'Se necesita agua, comida, no llega ayuda. Por favor.','Vía a Rocafuerte',-0.7842208000,-80.2343302000,'live',292,2,'2016-04-20 20:53:05','2016-04-20 20:53:05',0,NULL,'2016-04-20 20:53:05',NULL),
	(1692,NULL,NULL,'Se necesita agua, comida, no llega ayuda. Por favor.','Vía a Rocafuerte',-0.7842208000,-80.2343302000,'live',292,2,'2016-04-20 20:53:05','2016-04-20 20:53:05',0,NULL,'2016-04-20 20:53:05',NULL),
	(1702,NULL,NULL,'Se necesita agua, comida, no llega ayuda. Por favor.','Vía a Rocafuerte',-0.7842208000,-80.2343302000,'live',292,2,'2016-04-20 20:53:06','2016-04-20 20:53:06',0,NULL,'2016-04-20 20:53:06',NULL),
	(1712,NULL,NULL,'@camiladonoso87 Michelle Pérez está en Calceta. Dice que están pidiendo BARRAS ENERGÉTICAS para los niños. ','E384',-0.8411963560,-80.1593399048,'live',32,1,'2016-04-20 20:53:48','2016-04-20 20:53:48',0,NULL,'2016-04-20 20:53:48',NULL),
	(1722,NULL,NULL,'@milenaebriones\nPor favor sesolicita ayuda de electricidad y AGUA en el barrio 9 de octubre, calle110, tras ALES sectorTarqui #EcuadorListoYSolidario','Calle 110',-0.9581664600,-80.7089352608,'live',32,2,'2016-04-20 21:04:51','2016-04-20 21:04:51',0,NULL,'2016-04-20 21:04:51',NULL),
	(1732,NULL,NULL,'Porfavor aca no a llegado nada de ayuda me reportan familiares amigos de gente de Resbalón que no llega nada de ayuda aún!','E39',-0.9972020000,-80.4135440000,'live',842,6,'2016-04-20 21:10:05','2016-04-20 21:10:05',0,NULL,'2016-04-20 21:10:05',NULL),
	(1752,NULL,NULL,'El señor Harry González necesita ENVASES PLASTICOS con tapa y limpios para envasar agua.\n\nAv. Eloy Alfaro 860 y Polonia. Fábrica \"Puro Hielo\"\nContacto: 099 946 5621','Avenida General Eloy Alfaro',-0.1930502875,-78.4902843833,'live',242,2,'2016-04-20 21:22:10','2016-04-20 21:22:10',1,NULL,'2016-04-20 21:22:10',NULL),
	(1762,NULL,NULL,'Porfavor acá en resbalon non ha llegado ayuda aún necesitam comida y agua!','E39',-0.9972020000,-80.4135440000,'live',842,1,'2016-04-20 21:27:24','2016-04-20 21:27:24',0,NULL,'2016-04-20 21:27:24',NULL),
	(1772,NULL,NULL,'Porfavor acá en resbalon non ha llegado ayuda aún!','E39',-0.9972020000,-80.4135440000,'live',842,7,'2016-04-20 21:28:22','2016-04-20 21:28:22',0,NULL,'2016-04-20 21:28:22',NULL),
	(1792,NULL,NULL,'Se necesitan VOLUNTARIOS para armar casas prefabricadas. Para iniciar mañana jueves desde las 9am en el Municipio de Durán.\n\nContacto Vanessa Álvarez 099 158 4906','Municipio',-2.1776438265,-79.8543673754,'live',242,7,'2016-04-20 21:36:39','2016-04-20 21:36:39',1,NULL,'2016-04-20 21:36:39',NULL),
	(1802,NULL,NULL,'#Difundir Se necesitan donaciones URGENTES para enviar a #Chamanga\n\nLlamar:\n\n','Unnamed Road',0.2695467000,-79.9556424000,'live',242,1,'2016-04-20 21:44:51','2016-04-20 21:44:51',1,NULL,'2016-04-20 21:44:51',NULL),
	(1812,NULL,NULL,'#Difundir Se necesitan donaciones URGENTES para enviar a #Chamanga\n\nLlamar: 099 392 5053 / 099 642 4405 / 099 795 6020 ','Unnamed Road',0.2700652613,-79.9562215805,'live',32,2,'2016-04-20 21:47:29','2016-04-20 21:47:29',0,NULL,'2016-04-20 21:47:29',NULL),
	(1822,NULL,NULL,'@radiopoderfm\nSector hotelero de #Loja OFRECERÁ HOSPEDAJE GRATUITO a quienes deseen venir desde zonas afectadas por #SismoEcuador pic.twitter.com/Ilihza1fZt','Brasil',-4.0078909000,-79.2112769000,'live',32,7,'2016-04-20 21:58:10','2016-04-20 21:58:10',0,NULL,'2016-04-20 21:58:10',NULL),
	(1832,NULL,NULL,'AUN NO LLEGA AYUDA, NECESITAN COMIDA Y AGUA!','Calle 304',-0.9745215000,-80.7193627000,'live',862,1,'2016-04-20 21:59:24','2016-04-20 21:59:24',0,NULL,'2016-04-20 21:59:24',NULL),
	(1842,NULL,NULL,'@Lafu_8\nUrgente: Necesitamos donaciones de vendas autoadhesivas de 5 a 7 pulgadas para los perros rescatistas #SeNecesitaEC #SismoEcuador','Eloy Alfaro',0.0728487772,-80.0506997108,'live',32,5,'2016-04-20 22:03:18','2016-04-20 22:03:18',0,NULL,'2016-04-20 22:03:18',NULL),
	(1852,NULL,NULL,'la ayuda en especial esta siendo dirigida a los damnificados, pero los que no son considerados damnificados no tienen ni donde ni con que dinero comprarla ','12 de Octubre',-1.0657786581,-80.4476934671,'live',872,1,'2016-04-20 22:12:15','2016-04-20 22:12:15',0,NULL,'2016-04-20 22:12:15',NULL),
	(1862,NULL,NULL,'En San Isidro y sus alrededores se han caído casas y no ha llegado ayuda hasta el momento a socorrer y entregar alimentos ni insumos','Unnamed Road',-0.3785105830,-80.1809692383,'live',882,1,'2016-04-20 22:12:20','2016-04-20 22:12:20',0,NULL,'2016-04-20 22:12:20',NULL),
	(1872,NULL,NULL,'sin dinero ni donde comprar alimentos','15 de Abril',-1.0703617568,-80.4450353980,'live',872,1,'2016-04-20 22:27:42','2016-04-20 22:27:42',0,NULL,'2016-04-20 22:27:42',NULL),
	(1882,NULL,NULL,'@xabierloor\n#SeNecesitaEC Medicinas en San Vicente #Manabi. Si pasan por San Vicente frente a la Iglesia pregunten por la Dra. Ruth Loor','E383A',-0.6040437381,-80.4038500786,'live',32,4,'2016-04-20 22:41:31','2016-04-20 22:41:31',0,NULL,'2016-04-20 22:41:31',NULL),
	(1892,NULL,NULL,'Solicitan ayuda en un pequeño recinto ubicado entre el cantón Sucre y San Isidro, cerca de Bahía de Caraquez, donde existen cerca de 1000 habitantes y no ha llegado ayuda alguna.','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',892,1,'2016-04-21 00:06:20','2016-04-21 00:06:20',0,NULL,'2016-04-21 00:06:20',NULL),
	(1902,NULL,NULL,'Agua','Via Puerto-Aeropuerto',-0.9508638184,-80.7102227211,'live',902,2,'2016-04-21 00:41:38','2016-04-21 00:41:38',0,NULL,'2016-04-21 00:41:38',NULL),
	(1922,NULL,NULL,'Prueba','Unnamed Road',0.2389519440,-79.9955749512,'live',922,5,'2016-04-21 02:28:22','2016-04-21 02:28:22',0,NULL,'2016-04-21 02:28:22',NULL),
	(1932,NULL,NULL,'Esta zona fue azotada por inundaciones la semana pasada, ahora necesitan agua, comida y energía luego del terremoto.','Ruta del Spondylus',-0.9210952711,-80.4597473145,'live',932,1,'2016-04-21 03:01:16','2016-04-21 03:01:16',0,NULL,'2016-04-21 03:01:16',NULL),
	(1942,NULL,NULL,'Mañana dejar comida en La Burguesa Quito (Muros y Gonz Suárez) o La Tejedora (Junto Scala Cumbayá) para Cojimíes #SeNecesitaEC Salen viernes para Cojimíes','Unnamed Road',0.3650998203,-80.0373530388,'live',942,1,'2016-04-21 03:48:36','2016-04-21 03:48:36',0,NULL,'2016-04-21 03:48:36',NULL),
	(1952,NULL,NULL,'Agua ','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',952,2,'2016-04-21 05:21:42','2016-04-21 05:21:42',0,NULL,'2016-04-21 05:21:42',NULL),
	(1962,NULL,NULL,'Agua ','Ruta del Spondylus',-0.6186619000,-80.4273644000,'live',962,2,'2016-04-21 05:21:42','2016-04-21 05:21:42',0,NULL,'2016-04-21 05:21:42',NULL),
	(1972,NULL,NULL,'Necesitan agua y alimentos','Avenida 108',-0.9559099000,-80.7049003000,'live',972,1,'2016-04-21 13:07:06','2016-04-21 13:07:06',0,NULL,'2016-04-21 13:07:05',NULL),
	(1982,NULL,NULL,'Agua y comida varias familias','Calle 105',-0.9536221000,-80.7140694000,'live',982,1,'2016-04-21 13:46:45','2016-04-21 13:46:45',0,NULL,'2016-04-21 13:46:45',NULL),
	(1992,NULL,NULL,'Amigos por favor Barrio Santa Clara frente a la Coca Cola En Manta.\n\n No tienen comida, agua y personas enfermas','Avenida 204',-0.9740991984,-80.7042789459,'live',992,1,'2016-04-21 13:52:22','2016-04-21 13:52:22',0,NULL,'2016-04-21 13:52:22',NULL),
	(2002,NULL,NULL,'Amigos por favor Barrio Santa Clara frente a la Coca Cola En Manta\nNo tienen comida, agua y personas enfermas\nGracias. Llamar Sra Erika Cedeño 098 265 3949','Avenida 206',-0.9738095616,-80.7048583031,'live',992,2,'2016-04-21 13:56:04','2016-04-21 13:56:04',0,NULL,'2016-04-21 13:56:04',NULL),
	(2012,NULL,NULL,'SE OFRECE GUÍA A LUGARES SIN ATENCIÓN EN PORTOVIEJO: Favor llamar a Diego Vera 098 417 3615','10 de Agosto',-1.0574598739,-80.4537391663,'live',992,5,'2016-04-21 14:00:27','2016-04-21 14:00:27',0,NULL,'2016-04-21 14:00:27',NULL),
	(2022,NULL,NULL,'Barrio complicado San Pablo de Portoviejo, necesita ayuda comida, agua, atención medica','Avenida Alajuela',-1.0504873103,-80.4510998726,'live',992,1,'2016-04-21 14:04:19','2016-04-21 14:04:19',0,NULL,'2016-04-21 14:04:19',NULL),
	(2032,NULL,NULL,'Se necesita transporte','Unnamed Road',-0.5822653681,-78.8049316406,'live',1002,6,'2016-04-21 14:06:35','2016-04-21 14:06:35',0,NULL,'2016-04-21 14:06:35',NULL),
	(2042,NULL,NULL,'Comunidad Cañitas en Junin necesita apoyo con agua, comida, medicinas','E384',-0.9258528919,-80.2066352963,'live',992,2,'2016-04-21 14:19:44','2016-04-21 14:19:44',0,NULL,'2016-04-21 14:19:44',NULL),
	(2052,NULL,NULL,'En Quiroga nos piden ayuda con agua y comida','Calceta - Via Quiroga - Pichincha',-0.8857803340,-80.0994944572,'live',1012,2,'2016-04-21 14:28:23','2016-04-21 14:28:23',0,NULL,'2016-04-21 14:28:23',NULL),
	(2062,NULL,NULL,'@sunshineden1 En Jama llegan donaciones pero hacen falta medicina, leche, pañales y biberones por favor RT #SeNecesitaEC','Avenida Jama',-0.2019055479,-80.2639701962,'live',992,4,'2016-04-21 14:33:58','2016-04-21 14:33:58',0,NULL,'2016-04-21 14:33:58',NULL),
	(2072,NULL,NULL,'Pueblos que mas necesitan ayuda son CABUYA, EL CABUYAL (solo se llega por medio de lanchas) y EL MATAL.','Avenida Jama',-0.1968093816,-80.2755546570,'live',992,1,'2016-04-21 15:12:18','2016-04-21 15:12:18',0,NULL,'2016-04-21 15:12:18',NULL),
	(2082,NULL,NULL,'Provisiones Asociación Cerro Seco\n\nSe requiere: agua, alimento, carpas, plásticos, vestido (están durmiendo en las calles). CONTACTO: Marcelo Luque, telf 099 437 6399\n\nBahía de Caráquez, Cantón Sucre, Manabí, Ecuador','Avenida Virgilio Ratti',-0.6064254068,-80.4285049438,'live',992,2,'2016-04-21 15:50:14','2016-04-21 15:50:14',0,NULL,'2016-04-21 15:50:14',NULL),
	(2092,NULL,NULL,'Ayuda para San Jacinto - contacto: \nCecilia 098 509 2324','Unnamed Road',-0.7868710157,-80.5002593994,'live',992,2,'2016-04-21 16:00:22','2016-04-21 16:00:22',0,NULL,'2016-04-21 16:00:22',NULL),
	(2102,NULL,NULL,'Ayuda para San Vicente - contactos con el Sr. \nPablo Vélez 098 947 3162','E383A',-0.6031211094,-80.4043865204,'live',992,1,'2016-04-21 16:03:22','2016-04-21 16:03:22',0,NULL,'2016-04-21 16:03:22',NULL),
	(2112,NULL,NULL,'Ayuda para San Mateo por favor - contactos con Monica 098 874 4340','Unnamed Road',-0.9592418753,-80.8123826981,'live',992,4,'2016-04-21 16:09:25','2016-04-21 16:09:25',0,NULL,'2016-04-21 16:09:25',NULL),
	(2122,NULL,NULL,'Ayuda para EL MATAL, contacto: \nRicardo Vaca 098 084 6709\nGracias por su apoyo.','Ruta del Spondylus',-0.1910587585,-80.2873992920,'live',992,1,'2016-04-21 16:14:07','2016-04-21 16:14:07',0,NULL,'2016-04-21 16:14:07',NULL),
	(2132,NULL,NULL,'LA CHORRERA, necesita de ayuda con agua y alimentos - contacto:\nÁngel Robles 098 055 667','Calle G',0.0646090371,-80.0596046448,'live',992,2,'2016-04-21 16:24:53','2016-04-21 16:24:53',0,NULL,'2016-04-21 16:24:53',NULL),
	(2142,NULL,NULL,'No llega ayuda a SOSOTE queda al sureste del canton rocafuert en el km 10 de la via portoviejo-chone\n\nNecesitan Agua y Alimentos.','E39A',-0.9602287897,-80.4662704468,'live',992,2,'2016-04-21 16:36:37','2016-04-21 16:36:37',0,NULL,'2016-04-21 16:36:37',NULL),
	(2152,NULL,NULL,'El pueblo de PAVON ubicado en la parroquia ROCAFUERTE tambie necesita atencion','Via la California',-0.9147875252,-80.4565715790,'live',992,1,'2016-04-21 16:39:10','2016-04-21 16:39:10',0,NULL,'2016-04-21 16:39:10',NULL),
	(2162,NULL,NULL,'Manta los necesita, puedes hacer llegar tu donación al Patronato Municipal de Manta.\n\nContactos: Analía Navarrete 099 171 5041 / Carolina Carrera 095 904 7107 / 096 739 5553','Avenida de la Cultura',-0.9545272094,-80.7248514891,'live',992,1,'2016-04-21 17:08:32','2016-04-21 17:08:32',0,NULL,'2016-04-21 17:08:32',NULL),
	(2172,NULL,NULL,'@magraciamedinaf\n\nPORFA DIFUNDIR #SeNecesitaEC camioneta para transportar 14 perritos de Manta a Guayaquil. cc @nubiasandovalz #EcuadorListoYSolidario','Vía Interbarrial',-0.9684673687,-80.7155227661,'live',992,6,'2016-04-21 17:16:45','2016-04-21 17:16:45',0,NULL,'2016-04-21 17:16:45',NULL),
	(2182,NULL,NULL,'Se necesita para llevar a Cañitas y Portoviejo:\n-Agua para beber\n-Enlatados\n-comida para animales ','Ruta del Spondylus',-0.8551852253,-80.4693603516,'live',992,2,'2016-04-21 17:32:54','2016-04-21 17:32:54',0,NULL,'2016-04-21 17:32:54',NULL),
	(2192,NULL,NULL,'\"Don Juan\", \"La Piquigua\", \"10 de Agosto\" parroquias aledañas a Jama necesitan ayuda con alimento y agua. ','Avenida Jama',-0.1908012678,-80.2614355087,'live',992,1,'2016-04-21 17:51:35','2016-04-21 17:51:35',0,NULL,'2016-04-21 17:51:35',NULL),
	(2202,NULL,NULL,'#SeNecesitaEC CAL y CAMIONES para su transporte para construir 2 fosas en Canoa y Pedernales\nContacto con @mgbm82','Ruta del Spondylus',-0.4630086096,-80.4544258118,'live',992,6,'2016-04-21 17:57:44','2016-04-21 17:57:44',0,NULL,'2016-04-21 17:57:44',NULL),
	(2212,NULL,NULL,'#SeNecesitaEC CAL y CAMIONES para su transporte para construir 2 fosas en Canoa y Pedernales\n\nContacto con @mgbm82','Juan Pereira',0.0739002023,-80.0500774384,'live',992,6,'2016-04-21 17:58:57','2016-04-21 17:58:57',0,NULL,'2016-04-21 17:58:57',NULL),
	(2222,NULL,NULL,'No se olviden de Canuto, necesitan de su ayuda con Agua y alimentos no perecibles.','E384',-0.7951957990,-80.1280546188,'live',992,2,'2016-04-21 18:03:06','2016-04-21 18:03:06',0,NULL,'2016-04-21 18:03:06',NULL),
	(2232,NULL,NULL,'@Jecalana\n#SeNecesitaEC Ollas, vajilla plástica NO DESECHABLE, no hay en qué preparar la comida','Calle 304',-0.9676533000,-80.7089101000,'live',992,1,'2016-04-21 18:09:24','2016-04-21 18:09:24',0,NULL,'2016-04-21 18:09:24',NULL);

/*!40000 ALTER TABLE `crimes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pictures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crime_id` int(11) DEFAULT NULL,
  `status` enum('live','banned','protected','deleted') DEFAULT 'live',
  `classification` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_sensitive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;

INSERT INTO `pictures` (`id`, `crime_id`, `status`, `classification`, `created_at`, `updated_at`, `image`, `is_sensitive`)
VALUES
	(2,352,'live',NULL,'2016-04-19 16:48:51','2016-04-19 16:48:51','files.png',NULL),
	(12,382,'live',NULL,'2016-04-19 17:30:27','2016-04-19 17:30:27','files.png',NULL),
	(22,452,'live',NULL,'2016-04-19 18:47:03','2016-04-19 18:47:03','files.png',NULL),
	(32,522,'live',NULL,'2016-04-19 19:57:54','2016-04-19 19:57:54','files.png',NULL),
	(42,672,'live',NULL,'2016-04-19 20:43:01','2016-04-19 20:43:01','files.png',NULL),
	(52,832,'live',NULL,'2016-04-19 21:38:14','2016-04-19 21:38:14','files.png',NULL),
	(62,842,'live',NULL,'2016-04-19 21:41:06','2016-04-19 21:41:06','files.png',NULL),
	(72,852,'live',NULL,'2016-04-19 21:44:35','2016-04-19 21:44:35','files.png',NULL),
	(82,1372,'live',NULL,'2016-04-20 16:25:27','2016-04-20 16:25:27','files.png',NULL),
	(92,1502,'live',NULL,'2016-04-20 17:48:25','2016-04-20 17:48:25','files.png',NULL),
	(102,1552,'live',NULL,'2016-04-20 18:52:39','2016-04-20 18:52:39','files.png',NULL),
	(112,1582,'live',NULL,'2016-04-20 19:29:25','2016-04-20 19:29:25','files.png',NULL),
	(122,1612,'live',NULL,'2016-04-20 20:10:29','2016-04-20 20:10:29','files.png',NULL),
	(132,1662,'live',NULL,'2016-04-20 20:50:16','2016-04-20 20:50:16','files.png',NULL),
	(152,1752,'live',NULL,'2016-04-20 21:22:10','2016-04-20 21:22:10','files.png',NULL),
	(172,1792,'live',NULL,'2016-04-20 21:36:39','2016-04-20 21:36:39','files.png',NULL),
	(182,1802,'live',NULL,'2016-04-20 21:44:51','2016-04-20 21:44:51','files.png',NULL);

/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;

INSERT INTO `schema_migrations` (`version`)
VALUES
	('20120315214019'),
	('20120327211241'),
	('20120327212053'),
	('20120327212202'),
	('20120327212833'),
	('20120327220845'),
	('20120328144808'),
	('20120328180055'),
	('20120329024613'),
	('20120329024915'),
	('20120329025213'),
	('20120329025329'),
	('20120420180641'),
	('20120606154341'),
	('20120701061135'),
	('20120930025410'),
	('20121017202645'),
	('20121030025007'),
	('20121030025023'),
	('20121030025039'),
	('20130212192100'),
	('20130315030346');

/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sources`;

CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(255) DEFAULT NULL,
  `status` enum('active','blocked','banned','protected') DEFAULT 'active',
  `ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `details` text,
  `device_id` varchar(255) DEFAULT NULL,
  `crimes_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8;

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;

INSERT INTO `sources` (`id`, `device`, `status`, `ip`, `created_at`, `updated_at`, `details`, `device_id`, `crimes_count`)
VALUES
	(2,'iPhone','active','186.71.29.58','2016-04-18 21:13:26','2016-04-18 21:13:26','{\"browser\":\"Safari\",\"version\":\"9.3\",\"platform\":\"iPhone\"}','',1),
	(12,'Windows','active','186.71.29.58','2016-04-18 23:51:21','2016-04-18 23:51:21','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(22,'Windows','active','190.12.7.118','2016-04-18 23:53:31','2016-04-18 23:53:31','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(32,'Macintosh','active','186.71.29.58','2016-04-19 00:20:14','2016-04-19 00:20:14','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',37),
	(42,'Linux','active','66.102.8.215','2016-04-19 00:21:36','2016-04-19 00:21:36','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(52,'Windows','active','186.69.117.2','2016-04-19 02:08:18','2016-04-19 02:08:18','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(62,'Linux','active','66.102.8.193','2016-04-19 02:15:45','2016-04-19 02:15:45','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(72,'Linux','active','66.102.8.155','2016-04-19 02:16:58','2016-04-19 02:16:58','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(82,'Linux','active','66.249.88.247','2016-04-19 02:16:58','2016-04-19 02:16:58','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(92,'iPhone','active','181.112.8.123','2016-04-19 02:22:47','2016-04-19 02:22:47','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(102,'Linux','active','181.112.8.123','2016-04-19 02:28:46','2016-04-19 02:28:46','{\"browser\":\"Chrome\",\"version\":\"47.0.2526.83\",\"platform\":\"Linux\"}','',1),
	(112,'iPhone','active','181.198.150.8','2016-04-19 03:20:07','2016-04-19 03:20:07','{\"browser\":\"Safari\",\"version\":\"7.1.2\",\"platform\":\"iPhone\"}','',4),
	(122,'Linux','active','66.249.88.217','2016-04-19 03:25:07','2016-04-19 03:25:07','{\"browser\":\"Chrome\",\"version\":\"48.0.2564.95\",\"platform\":\"Linux\"}','',1),
	(132,'iPhone','active','190.12.7.254','2016-04-19 03:47:48','2016-04-19 03:47:48','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(142,'Linux','active','181.198.139.12','2016-04-19 04:28:51','2016-04-19 04:28:51','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(152,'Linux','active','181.112.104.0','2016-04-19 05:00:12','2016-04-19 05:00:12','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(162,'Mobile','active','190.214.73.191','2016-04-19 05:30:31','2016-04-19 05:30:31','{\"browser\":\"Android\",\"version\":\"\",\"platform\":\"Mobile\"}','',1),
	(172,'Linux','active','190.63.1.57','2016-04-19 13:03:59','2016-04-19 13:03:59','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',0),
	(182,'Linux','active','181.39.253.135','2016-04-19 13:12:18','2016-04-19 13:12:18','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(192,'iPhone','active','190.63.1.216','2016-04-19 13:19:07','2016-04-19 13:19:07','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(202,'Linux','active','200.125.244.225','2016-04-19 13:35:11','2016-04-19 13:35:11','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(212,'iPhone','active','181.112.107.88','2016-04-19 14:08:00','2016-04-19 14:08:00','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(222,'Windows','active','190.152.144.3','2016-04-19 14:16:49','2016-04-19 14:16:49','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(232,'Macintosh','active','181.198.54.140','2016-04-19 14:42:18','2016-04-19 14:42:18','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',1),
	(242,'Macintosh','active','190.12.7.118','2016-04-19 15:21:03','2016-04-19 15:21:03','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',39),
	(252,'Linux','active','186.69.113.7','2016-04-19 16:08:24','2016-04-19 16:08:24','{\"browser\":\"Chrome\",\"version\":\"1.5\",\"platform\":\"Linux\"}','',1),
	(262,'Macintosh','active','186.4.147.168','2016-04-19 16:10:17','2016-04-19 16:10:17','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',1),
	(272,'Macintosh','active','186.5.66.122','2016-04-19 16:12:06','2016-04-19 16:12:06','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.110\",\"platform\":\"Macintosh\"}','',1),
	(282,'Macintosh','active','201.217.106.221','2016-04-19 16:24:55','2016-04-19 16:24:55','{\"browser\":\"Firefox\",\"version\":\"45.0\",\"platform\":\"Macintosh\"}','',1),
	(292,'Linux','active','200.7.247.55','2016-04-19 16:26:47','2016-04-19 16:26:47','{\"browser\":\"Chrome\",\"version\":\"38.0.2125.102\",\"platform\":\"Linux\"}','',4),
	(302,'Macintosh','active','181.112.24.217','2016-04-19 16:27:15','2016-04-19 16:27:15','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',1),
	(312,'Macintosh','active','190.216.222.2','2016-04-19 16:43:49','2016-04-19 16:43:49','{\"browser\":\"Firefox\",\"version\":\"45.0\",\"platform\":\"Macintosh\"}','',0),
	(322,'Windows','active','181.199.73.98','2016-04-19 16:48:51','2016-04-19 16:48:51','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(332,'iPhone','active','200.7.247.167','2016-04-19 16:56:37','2016-04-19 16:56:37','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(342,'Linux','active','181.39.250.234','2016-04-19 18:07:04','2016-04-19 18:07:04','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',0),
	(352,'Windows','active','181.112.155.172','2016-04-19 18:19:56','2016-04-19 18:19:56','{\"browser\":\"Firefox\",\"version\":\"27.0\",\"platform\":\"Windows\"}','',1),
	(362,'Linux','active','190.131.88.125','2016-04-19 18:46:47','2016-04-19 18:46:47','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',2),
	(372,'Linux','active','66.102.8.199','2016-04-19 18:47:03','2016-04-19 18:47:03','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(382,'iPhone','active','200.125.245.239','2016-04-19 18:47:15','2016-04-19 18:47:15','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(392,'Windows','active','181.39.254.234','2016-04-19 18:52:00','2016-04-19 18:52:00','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(402,'Macintosh','active','179.49.20.5','2016-04-19 19:33:44','2016-04-19 19:33:44','{\"browser\":\"Safari\",\"version\":\"9.0.3\",\"platform\":\"Macintosh\"}','',1),
	(412,'iPhone','active','200.31.24.69','2016-04-19 19:45:54','2016-04-19 19:45:54','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(422,'Linux','active','181.112.80.106','2016-04-19 19:51:20','2016-04-19 19:51:20','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(432,'Windows','active','190.95.159.174','2016-04-19 19:57:53','2016-04-19 19:57:53','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',6),
	(442,'Windows','active','186.42.106.70','2016-04-19 20:24:52','2016-04-19 20:24:52','{\"browser\":\"Firefox\",\"version\":\"45.0\",\"platform\":\"Windows\"}','',3),
	(452,'iPhone','active','186.65.32.123','2016-04-19 20:26:06','2016-04-19 20:26:06','{\"browser\":\"Safari\",\"version\":\"9.2.1\",\"platform\":\"iPhone\"}','',1),
	(462,'Linux','active','181.112.82.77','2016-04-19 20:42:09','2016-04-19 20:42:09','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',3),
	(472,'Linux','active','181.113.96.180','2016-04-19 20:43:00','2016-04-19 20:43:00','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',1),
	(482,'Macintosh','active','200.24.214.35','2016-04-19 20:43:36','2016-04-19 20:43:36','{\"browser\":\"Safari\",\"version\":\"9.1\",\"platform\":\"Macintosh\"}','',4),
	(492,'Linux','active','186.101.251.54','2016-04-19 20:45:41','2016-04-19 20:45:41','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(502,'Android','active','181.39.221.105','2016-04-19 20:56:36','2016-04-19 20:56:36','{\"browser\":\"Firefox\",\"version\":\"34.0\",\"platform\":\"Android\"}','',1),
	(512,'Windows','active','190.130.224.252','2016-04-19 21:02:42','2016-04-19 21:02:42','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(522,'iPhone','active','83.45.181.163','2016-04-19 21:44:59','2016-04-19 21:44:59','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',2),
	(532,'Windows','active','181.113.99.126','2016-04-19 22:51:50','2016-04-19 22:51:50','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(542,'iPhone','active','181.39.218.204','2016-04-19 23:26:52','2016-04-19 23:26:52','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(552,'Linux','active','181.113.145.52','2016-04-20 00:23:34','2016-04-20 00:23:34','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(562,'iPhone','active','186.65.37.60','2016-04-20 00:32:11','2016-04-20 00:32:11','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',2),
	(572,'iPhone','active','186.4.250.58','2016-04-20 01:16:00','2016-04-20 01:16:00','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(582,'iPhone','active','186.4.250.58','2016-04-20 01:16:00','2016-04-20 01:16:00','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(592,'Windows','active','186.3.251.204','2016-04-20 01:28:49','2016-04-20 01:28:49','{\"browser\":\"Internet Explorer\",\"version\":\"10.0\",\"platform\":\"Windows\"}','',1),
	(602,'iPhone','active','181.175.202.98','2016-04-20 01:51:09','2016-04-20 01:51:09','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',2),
	(612,'iPhone','active','181.198.126.125','2016-04-20 01:58:38','2016-04-20 01:58:38','{\"browser\":\"Safari\",\"version\":\"8.3\",\"platform\":\"iPhone\"}','',1),
	(622,'iPhone','active','190.12.51.129','2016-04-20 03:00:24','2016-04-20 03:00:24','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',0),
	(632,'Linux','active','186.65.32.125','2016-04-20 03:16:59','2016-04-20 03:16:59','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(642,'Linux','active','190.131.118.132','2016-04-20 03:53:15','2016-04-20 03:53:15','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(652,'iPhone','active','190.154.116.91','2016-04-20 04:18:59','2016-04-20 04:18:59','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(662,'iPhone','active','166.137.8.118','2016-04-20 04:23:07','2016-04-20 04:23:07','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(672,'Macintosh','active','180.70.129.13','2016-04-20 05:44:52','2016-04-20 05:44:52','{\"browser\":\"Chrome\",\"version\":\"50.0.2661.75\",\"platform\":\"Macintosh\"}','',1),
	(682,'Linux','active','181.175.80.203','2016-04-20 10:59:42','2016-04-20 10:59:42','{\"browser\":\"Android\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(692,'Linux','active','186.65.32.20','2016-04-20 11:51:50','2016-04-20 11:51:50','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',4),
	(702,'Linux','active','186.46.205.44','2016-04-20 12:18:32','2016-04-20 12:18:32','{\"browser\":\"Android\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',1),
	(712,'iPhone','active','190.152.178.226','2016-04-20 12:24:13','2016-04-20 12:24:13','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(722,'iPhone','active','181.175.170.21','2016-04-20 13:19:38','2016-04-20 13:19:38','{\"browser\":\"Safari\",\"version\":\"8.1.3\",\"platform\":\"iPhone\"}','',1),
	(732,'Windows','active','186.4.132.115','2016-04-20 14:55:47','2016-04-20 14:55:47','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(742,'iPhone','active','147.75.208.237','2016-04-20 15:33:48','2016-04-20 15:33:48','{\"browser\":\"Safari\",\"version\":\"9.2.1\",\"platform\":\"iPhone\"}','',1),
	(752,'Linux','active','201.183.153.128','2016-04-20 16:11:05','2016-04-20 16:11:05','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.105\",\"platform\":\"Linux\"}','',2),
	(762,'Linux','active','190.63.119.38','2016-04-20 16:20:16','2016-04-20 16:20:16','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',0),
	(772,'Windows','active','181.175.172.17','2016-04-20 16:25:26','2016-04-20 16:25:26','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(782,'Windows','active','186.46.207.31','2016-04-20 16:42:04','2016-04-20 16:42:04','{\"browser\":\"Firefox\",\"version\":\"45.0\",\"platform\":\"Windows\"}','',1),
	(792,'Windows','active','181.196.26.130','2016-04-20 16:53:36','2016-04-20 16:53:36','{\"browser\":\"Chrome\",\"version\":\"50.0.2661.75\",\"platform\":\"Windows\"}','',1),
	(802,'Windows','active','186.71.27.132','2016-04-20 17:00:25','2016-04-20 17:00:25','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(812,'Macintosh','active','70.161.209.146','2016-04-20 17:50:58','2016-04-20 17:50:58','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',2),
	(822,'iPhone','active','200.7.246.235','2016-04-20 18:52:38','2016-04-20 18:52:38','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(832,'Macintosh','active','190.216.214.177','2016-04-20 19:00:17','2016-04-20 19:00:17','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',2),
	(842,'iPad','active','181.198.124.101','2016-04-20 21:10:05','2016-04-20 21:10:05','{\"browser\":\"Safari\",\"version\":\"9.2.1\",\"platform\":\"iPad\"}','',3),
	(852,'Linux','active','186.46.206.173','2016-04-20 21:38:45','2016-04-20 21:38:45','{\"browser\":\"Android\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',0),
	(862,'Macintosh','active','50.153.103.147','2016-04-20 21:59:24','2016-04-20 21:59:24','{\"browser\":\"Safari\",\"version\":\"9.1\",\"platform\":\"Macintosh\"}','',1),
	(872,'Windows','active','186.78.16.166','2016-04-20 22:12:15','2016-04-20 22:12:15','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',2),
	(882,'Windows','active','190.96.105.64','2016-04-20 22:12:20','2016-04-20 22:12:20','{\"browser\":\"Chrome\",\"version\":\"48.0.2564.116\",\"platform\":\"Windows\"}','',1),
	(892,'Windows','active','181.39.19.138','2016-04-21 00:06:20','2016-04-21 00:06:20','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(902,'Windows','active','186.47.254.17','2016-04-21 00:41:38','2016-04-21 00:41:38','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(912,'Linux','active','200.7.247.208','2016-04-21 01:16:50','2016-04-21 01:16:50','{\"browser\":\"Chrome\",\"version\":\"4.0\",\"platform\":\"Linux\"}','',0),
	(922,'iPhone','active','186.71.60.138','2016-04-21 02:28:22','2016-04-21 02:28:22','{\"browser\":\"Safari\",\"version\":\"9.0.2\",\"platform\":\"iPhone\"}','',1),
	(932,'Windows','active','186.178.172.162','2016-04-21 03:01:16','2016-04-21 03:01:16','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(942,'Windows','active','181.198.142.241','2016-04-21 03:48:36','2016-04-21 03:48:36','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(952,'iPhone','active','181.198.213.137','2016-04-21 05:21:42','2016-04-21 05:21:42','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(962,'iPhone','active','181.198.213.137','2016-04-21 05:21:42','2016-04-21 05:21:42','{\"browser\":\"Safari\",\"version\":\"9.3.1\",\"platform\":\"iPhone\"}','',1),
	(972,'Linux','active','181.113.147.32','2016-04-21 13:07:05','2016-04-21 13:07:05','{\"browser\":\"Chrome\",\"version\":\"1.5\",\"platform\":\"Linux\"}','',1),
	(982,'Linux','active','181.113.157.238','2016-04-21 13:46:45','2016-04-21 13:46:45','{\"browser\":\"Chrome\",\"version\":\"1.5\",\"platform\":\"Linux\"}','',1),
	(992,'Macintosh','active','190.130.217.101','2016-04-21 13:52:22','2016-04-21 13:52:22','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',23),
	(1002,'Macintosh','active','186.71.186.8','2016-04-21 14:06:35','2016-04-21 14:06:35','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Macintosh\"}','',1),
	(1012,'Windows','active','186.3.212.90','2016-04-21 14:28:23','2016-04-21 14:28:23','{\"browser\":\"Chrome\",\"version\":\"49.0.2623.112\",\"platform\":\"Windows\"}','',1),
	(1022,'Macintosh','active','208.86.202.10','2016-04-21 14:44:03','2016-04-21 14:44:03','{\"browser\":\"Safari\",\"version\":\"9.1\",\"platform\":\"Macintosh\"}','',0);

/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subcategories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subcategories`;

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `is_promoted` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `color` char(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `ranking` (`ranking`),
  KEY `is_promoted` (`is_promoted`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `ranking`, `is_promoted`, `created_at`, `updated_at`, `color`)
VALUES
	(1,'food',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#DE6B13'),
	(2,'water',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#DE6B13'),
	(3,'clothing',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#FFC800'),
	(4,'drugs',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#B32424'),
	(5,'rescue',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#B32424'),
	(6,'transport',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#DE6B13'),
	(7,'hostel',1,NULL,NULL,'2012-09-24 03:40:23','2012-09-24 03:40:23','#FFC800');

/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
