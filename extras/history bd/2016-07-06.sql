-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para bienestarcun
CREATE DATABASE IF NOT EXISTS `bienestarcun` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `bienestarcun`;


-- Volcando estructura para tabla bienestarcun.asistencias
CREATE TABLE IF NOT EXISTS `asistencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Presencia` varchar(3) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'ausente, presente, excusado',
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Usuario` bigint(15) NOT NULL,
  `Itinerario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Asistencias_usuarios` (`Usuario`),
  KEY `FK_Asistencias_itinerarios` (`Itinerario`),
  CONSTRAINT `FK_Asistencias_itinerarios` FOREIGN KEY (`Itinerario`) REFERENCES `itinerarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Asistencias_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el listado de las asistencias o inasistencia de los estudiantes a los itinerarios';

-- Volcando datos para la tabla bienestarcun.asistencias: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` (`id`, `Presencia`, `Fecha`, `Usuario`, `Itinerario`) VALUES
	(7, '111', '2015-12-07 10:41:15', 1104379, 10),
	(8, '111', '2015-12-07 10:41:15', 8, 10);
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.auditoria
CREATE TABLE IF NOT EXISTS `auditoria` (
  `Id` int(11) NOT NULL,
  `Tabla` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Accion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User` bigint(15) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Auditoria_usuarios` (`User`),
  CONSTRAINT `FK_Auditoria_usuarios` FOREIGN KEY (`User`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran todos los movimientos realizados en la base de datos y el usuario que lo realizo';

-- Volcando datos para la tabla bienestarcun.auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.chatpsicologia
CREATE TABLE IF NOT EXISTS `chatpsicologia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Mensaje` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'leido, no leido',
  `Remitente` bigint(15) NOT NULL,
  `Destinatario` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_chatpsicologia_usuarios` (`Remitente`),
  KEY `FK_chatpsicologia_usuarios_2` (`Destinatario`),
  CONSTRAINT `FK_chatpsicologia_usuarios` FOREIGN KEY (`Remitente`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chatpsicologia_usuarios_2` FOREIGN KEY (`Destinatario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los mensajes dirijidos a la psicologa';

-- Volcando datos para la tabla bienestarcun.chatpsicologia: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `chatpsicologia` DISABLE KEYS */;
INSERT INTO `chatpsicologia` (`Id`, `Mensaje`, `Fecha`, `Estado`, `Remitente`, `Destinatario`) VALUES
	(109, 'hola', '2015-11-26 23:14:52', 1, 1104379, 7),
	(110, 'Hola', '2015-11-26 23:15:39', 1, 7, 1104379),
	(111, 'Hola', '2015-11-26 23:15:48', 1, 7, 1104379),
	(112, 'como esta', '2015-11-26 23:16:22', 1, 1104379, 7),
	(113, 'Bien', '2015-11-26 23:16:31', 1, 7, 1104379),
	(114, 'Y usted', '2015-11-26 23:17:08', 1, 7, 1104379),
	(115, 'bn gracias', '2015-11-26 23:17:15', 1, 1104379, 7),
	(116, 'lo que sucede es que me siento muy triste y tengo ganas de salir corriendo gritando locuras por la c', '2015-11-26 23:18:03', 1, 1104379, 7),
	(117, 'Cu', '2015-11-26 23:19:28', 1, 7, 1104379),
	(118, 'hola', '2015-11-26 23:21:58', 1, 1104379, 7),
	(119, 'Hola', '2015-11-26 23:22:28', 1, 7, 1104379),
	(120, 'como esta', '2015-11-26 23:22:41', 1, 1104379, 7),
	(121, 'Bien y usted', '2015-11-26 23:23:01', 1, 7, 1104379),
	(122, 'bn gracias', '2015-11-26 23:23:12', 1, 1104379, 7),
	(123, 'Hola, puede ayudarme', '2015-11-27 00:40:44', 1, 5, 7),
	(124, 'hola', '2015-12-01 11:21:43', 1, 1104379, 7),
	(125, 'Hi', '2015-12-09 14:41:11', 1, 4, 7),
	(126, 'Hola ', '2016-05-10 12:00:53', 1, 1104379, 7),
	(163, 'hola sico', '2016-05-12 20:23:44', 1, 1104379, 7),
	(185, 'hola', '2016-05-12 22:32:23', 1, 7, 1104379),
	(188, 'hola en q puedo ayudarle', '2016-05-12 22:32:53', 1, 7, 4),
	(190, 'si señor', '2016-05-12 22:33:45', 1, 7, 1104379),
	(191, 'puede benir', '2016-05-12 22:34:01', 1, 7, 1104379),
	(192, 'a la instalacion', '2016-05-12 22:34:20', 1, 7, 1104379),
	(194, 'ok va', '2016-05-12 22:36:41', 1, 7, 1104379),
	(195, 'para alla', '2016-05-12 22:37:00', 1, 7, 1104379),
	(196, 'va', '2016-05-12 22:38:24', 1, 7, 1104379),
	(197, 'egain', '2016-05-12 22:39:41', 1, 7, 1104379),
	(198, 'va', '2016-05-12 22:39:56', 1, 7, 1104379),
	(199, 'ttttttt', '2016-05-12 22:42:14', 1, 7, 1104379),
	(200, 'aaaaaa', '2016-05-12 22:50:19', 1, 7, 1104379),
	(201, 'eeeee', '2016-05-12 22:50:28', 1, 7, 1104379),
	(203, 'ggg si hola', '2016-05-14 11:58:55', 1, 7, 1104379),
	(207, 'hola', '2016-05-14 13:34:14', 1, 7, 1104379),
	(293, 'bien gracias', '2016-05-16 22:21:46', 1, 1104379, 7),
	(301, 'nada', '2016-05-17 20:49:15', 1, 1104379, 7),
	(307, 'vea', '2016-05-17 21:01:59', 1, 1104379, 7),
	(308, 'ahora?', '2016-05-17 21:04:34', 1, 1104379, 7),
	(310, 'hola', '2016-05-17 21:46:30', 1, 1104379, 7),
	(311, 'aja', '2016-05-17 21:48:13', 1, 1104379, 7),
	(312, 'jajajaja', '2016-05-17 21:53:45', 1, 1104379, 7),
	(313, 'sip', '2016-05-17 21:56:14', 1, 1104379, 7),
	(314, 'si señor', '2016-05-17 21:57:25', 1, 1104379, 7),
	(316, 'hola', '2016-05-17 22:00:39', 1, 4, 7),
	(317, 'hola', '2016-05-17 22:01:26', 1, 4, 7),
	(318, 'hola', '2016-05-17 22:07:28', 1, 4, 7),
	(319, 'hola', '2016-05-17 22:07:54', 1, 4, 7),
	(320, 'aja', '2016-05-17 22:08:47', 1, 4, 7),
	(321, 'si', '2016-05-17 22:08:58', 1, 1104379, 7),
	(322, 'depronto', '2016-05-17 22:09:22', 1, 1104379, 7),
	(324, 'aaa', '2016-05-17 22:11:16', 1, 1104379, 7),
	(325, 'help me', '2016-05-17 22:16:23', 1, 1104379, 7);
/*!40000 ALTER TABLE `chatpsicologia` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.circulos
CREATE TABLE IF NOT EXISTS `circulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(300) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  `Admin` bigint(15) DEFAULT NULL,
  `Sede` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Admin` (`Admin`),
  KEY `FK_circulos_usuarios` (`Admin`),
  KEY `FK_circulos_sede` (`Sede`),
  CONSTRAINT `FK_circulos_sede` FOREIGN KEY (`Sede`) REFERENCES `sede` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_circulos_usuarios` FOREIGN KEY (`Admin`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran aquellas actividades o eventos que requieran identificar un grupo de usuarios especificos, como las actividades de musica, danza, futbol etc';

-- Volcando datos para la tabla bienestarcun.circulos: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `circulos` DISABLE KEYS */;
INSERT INTO `circulos` (`id`, `Nombre`, `Descripcion`, `Estado`, `Admin`, `Sede`) VALUES
	(1, 'Musica', 'Actividad de canto, guitarra, bajo', 1, 1104379, 1),
	(2, 'Danza', 'Aprendizaje de bailes folcloricos, modernos, cumbia etc', 1, 3, 1),
	(3, 'Football', 'Deporte de juego de equipo en micro', 1, 41, 1),
	(4, 'Publico', 'Las notificaciones de este circulo estaran abiertas a todos los que tengan la app instalada', 1, NULL, 1),
	(5, 'Psicologa', 'Las notificaciones de este circulo podran ser vistas por usuario de psicologia', 1, NULL, 1),
	(6, 'Egresados', 'Las notificaciones de este circulo podran ser vistas por estudiantes egresados', 1, NULL, 1),
	(7, 'Estudiantes', 'Las notificaciones de este circulo podran ser vistas por estudiantes', 1, NULL, 1),
	(8, 'Docentes', 'Las notificaciones de este circulo podran ser vistas por los docentes', 1, NULL, 1),
	(9, 'Tutores bienestar', 'Las notificaciones de este circulo podran ser vistas por los tutores del area de bienestar', 1, NULL, 1),
	(24, 'Publico', 'circulo publico para la sede 6', 1, NULL, 6),
	(25, 'Psicologa', 'circulo Psicologa para la sede 6', 1, NULL, 6),
	(26, 'Egresados', 'circulo Egresados para la sede 6', 1, NULL, 6),
	(27, 'Estudiantes', 'circulo Estudiantes para la sede 6', 1, NULL, 6),
	(28, 'Docentes', 'circulo Docentes para la sede 6', 1, NULL, 6),
	(29, 'Tutores bienestar', 'circulo Tutores bienestar para la sede 6', 1, NULL, 6);
/*!40000 ALTER TABLE `circulos` ENABLE KEYS */;


-- Volcando estructura para procedimiento bienestarcun.CreateFileDefaultProcedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateFileDefaultProcedure`(IN `sede` INT(11) )
BEGIN 
	
	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Publico', 
															CONCAT('circulo publico para la sede ',sede ),
															sede );

	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Psicologa', 
															CONCAT('circulo Psicologa para la sede ',sede ),
															sede );
	
	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Egresados', 
															CONCAT('circulo Egresados para la sede ',sede ),
															sede );
	
	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Estudiantes', 
															CONCAT('circulo Estudiantes para la sede ',sede ),
															sede );
	
	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Docentes', 
															CONCAT('circulo Docentes para la sede ',sede ),
															sede );	

	INSERT INTO circulos(Nombre, Descripcion, Sede) VALUES( 'Tutores bienestar', 
															CONCAT('circulo Tutores bienestar para la sede ',sede ),
															sede );

	/*insertar persona default*/

	INSERT INTO personas VALUES( CAST(CONCAT(sede, '000000000') AS UNSIGNED INTEGER),
	 							'CC',
	 							'default',
	 							'default',
	 							'-',
	 							'-',
	 							'-',
	 							'M',
	 							0,
	 							sede);

	/* insertar usuario default*/

	INSERT INTO usuarios VALUES(CAST(CONCAT(sede, '000000000') AS UNSIGNED INTEGER),
								CONCAT('usuario',sede),
								CONCAT('usuario',sede),
								'1000',
								'1');

END//
DELIMITER ;


-- Volcando estructura para procedimiento bienestarcun.DelUsuarioCircleProcedure
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DelUsuarioCircleProcedure`(IN `idUsuario` BIGINT(15) )
BEGIN 
	
	DELETE FROM usuariocirculo WHERE Usuario = idUsuario;
END//
DELIMITER ;


-- Volcando estructura para tabla bienestarcun.depuracion
CREATE TABLE IF NOT EXISTS `depuracion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Contenido` text COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla bienestarcun.depuracion: ~57 rows (aproximadamente)
/*!40000 ALTER TABLE `depuracion` DISABLE KEYS */;
INSERT INTO `depuracion` (`Id`, `Contenido`, `Fecha`) VALUES
	(225, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 23#!#', '2015-12-06 19:08:47'),
	(226, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 23#!#', '2015-12-06 19:08:48'),
	(227, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 22#!#', '2015-12-06 19:09:15'),
	(228, 'Error desde php #!# Error: Cannot use object of type stdClass as array#!#Tipo: 1#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 22#!#', '2015-12-06 19:10:05'),
	(229, 'Error desde php #!# Error: Object of class stdClass could not be converted to string#!#Tipo: 4096#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 24#!#', '2015-12-06 19:12:21'),
	(230, 'Error desde php #!# Error: Undefined variable: sqlInsert#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 30#!#', '2015-12-06 19:13:29'),
	(231, 'Error desde php #!# Error: Undefined variable: sqlInsert#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 30#!#', '2015-12-06 19:13:30'),
	(232, 'Error desde php #!# Error: Undefined variable: sqlInsert#!#Tipo: 8#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/saveListAsitencia.php#!#linea: 32#!#', '2015-12-06 19:14:14'),
	(233, 'Error desde php #!# Error: chmod(): No existe el archivo o el directorio#!#Tipo: 2#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/SaveEvidencia.php#!#linea: 17#!#', '2015-12-08 18:20:13'),
	(234, 'Error desde php #!# Error: chmod(): No existe el archivo o el directorio#!#Tipo: 2#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/SaveEvidencia.php#!#linea: 17#!#', '2015-12-08 18:27:04'),
	(235, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T200902America/Bogota(2,341,-18000,0,1449623342)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:09:56'),
	(236, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201000America/Bogota(2,341,-18000,0,1449623400)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:11:19'),
	(237, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201158America/Bogota(2,341,-18000,0,1449623518)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:12:54'),
	(238, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201425America/Bogota(2,341,-18000,0,1449623665)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:15:29'),
	(239, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201551America/Bogota(2,341,-18000,0,1449623751)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:18:16'),
	(240, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201934America/Bogota(2,341,-18000,0,1449623974)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:19:43'),
	(241, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/10#!#20151208T201934America/Bogota(2,341,-18000,0,1449623974)#!#Evidencia.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:19:43'),
	(242, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/Evidencia#!#10#!#20151208_202409.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:24:39'),
	(243, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/sdcard0/Evidencia#!#10#!#20151208_202409.jpg: open failed: ENOENT (No such file or directory)', '2015-12-08 20:24:43'),
	(244, 'Error desde php #!# Error: chmod(): No existe el archivo o el directorio#!#Tipo: 2#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/SaveEvidencia.php#!#linea: 17#!#', '2015-12-08 20:28:26'),
	(245, 'Error desde php #!# Error: chmod(): No existe el archivo o el directorio#!#Tipo: 2#!#Archivo: /opt/lampp/htdocs/BienestarCun/core/android/adminCircle/SaveEvidencia.php#!#linea: 17#!#', '2015-12-08 20:30:09'),
	(246, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-05-10 11:57:17'),
	(247, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-05-10 11:57:21'),
	(248, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 18:45:14'),
	(249, 'Error desde android #!# Funcion: getNameUser try 1 #!#Clase : GeneralCode.java #!#null', '2016-05-17 20:17:43'),
	(250, 'Error desde android #!# Funcion: getNameUser try 1 #!#Clase : GeneralCode.java #!#null', '2016-05-17 20:21:39'),
	(251, 'Error desde android #!# Funcion: getNameUser try 1 #!#Clase : GeneralCode.java #!#null', '2016-05-17 20:36:19'),
	(252, 'Error desde android #!# Funcion: getNameUser try 1 #!#Clase : GeneralCode.java #!#null', '2016-05-17 20:53:06'),
	(253, 'Error desde android #!# Funcion: getNameUser try 1 #!#Clase : GeneralCode.java #!#null', '2016-05-17 21:03:14'),
	(254, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:45:47'),
	(255, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:45:58'),
	(256, 'Error desde android #!# Funcion: GetMensajesPendientesExists #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:47:49'),
	(257, 'Error desde android #!# Funcion: GetMensajesPendientesExists #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:49:11'),
	(258, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:53:40'),
	(259, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:56:06'),
	(260, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 21:57:15'),
	(261, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:00:03'),
	(262, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:00:51'),
	(263, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:00:51'),
	(264, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:01:17'),
	(265, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:07:16'),
	(266, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:07:24'),
	(267, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:07:42'),
	(268, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:07:42'),
	(269, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:09:07'),
	(270, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:09:07'),
	(271, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:10:01'),
	(272, 'Error desde android #!# Funcion: AddMesagesChat #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:10:01'),
	(273, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:11:01'),
	(274, 'Error desde android #!# Funcion: SearchChatPendientes #!#Clase : ChatPsicologiaManager.java #!#null', '2016-05-17 22:16:05'),
	(275, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:25:54'),
	(276, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:26:34'),
	(277, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:26:41'),
	(278, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:26:53'),
	(279, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:27:51'),
	(280, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:30:33'),
	(281, 'Error desde android #!# Funcion: SearchItinerarios #!#Clase : ItinerariosManager.java #!#Value msm at 0 of type java.lang.String cannot be converted to JSONArray', '2016-07-05 23:30:56'),
	(282, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/emulated/0/Evidencia#!#14#!#20160706_044638.jpg: open failed: ENOENT (No such file or directory)', '2016-07-05 23:46:43'),
	(283, 'Error desde android #!# Funcion: onActivityResult(try 1 get image FileNotFoundException) #!#Clase : MainActivity.java #!#/storage/emulated/0/Evidencia#!#14#!#20160706_044709.jpg: open failed: ENOENT (No such file or directory)', '2016-07-05 23:47:11');
/*!40000 ALTER TABLE `depuracion` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.desercion
CREATE TABLE IF NOT EXISTS `desercion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Jornada` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` tinyint(1) NOT NULL DEFAULT '0',
  `Desertor` bigint(15) NOT NULL,
  `Usuario` bigint(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Desercion_personas` (`Desertor`),
  KEY `FK_Desercion_usuarios` (`Usuario`),
  CONSTRAINT `FK_Desercion_personas` FOREIGN KEY (`Desertor`) REFERENCES `personas` (`Identificacion`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Desercion_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los registros hechos por los docente por estudiantes en ausencia prolongada con posible desercion';

-- Volcando datos para la tabla bienestarcun.desercion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `desercion` DISABLE KEYS */;
INSERT INTO `desercion` (`id`, `Jornada`, `Fecha`, `Estado`, `Desertor`, `Usuario`) VALUES
	(1, 'Nocturno', '2015-11-30 13:02:58', 0, 1104379, 1104379),
	(2, 'Diurno', '2015-11-30 13:05:19', 0, 1104379, 1104379),
	(6, 'Nocturno', '2015-11-30 13:41:19', 0, 1104379, 1104379),
	(7, 'Nocturno', '2015-11-30 13:47:13', 0, 1104379, 1104379),
	(8, 'Nocturno', '2015-12-01 10:54:31', 0, 1104379, 1104379);
/*!40000 ALTER TABLE `desercion` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.evidencias
CREATE TABLE IF NOT EXISTS `evidencias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreArchivo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ruta` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Itinerario` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Evidencias_itinerarios` (`Itinerario`),
  CONSTRAINT `FK_Evidencias_itinerarios` FOREIGN KEY (`Itinerario`) REFERENCES `itinerarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran la informacion de los archivos subidos por los administradores de los circulos, ubicacion, nombre del archivo etc.';

-- Volcando datos para la tabla bienestarcun.evidencias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidencias` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.facultad
CREATE TABLE IF NOT EXISTS `facultad` (
  `id` int(11) NOT NULL,
  `Facultad` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se registraran las facultades a las q pertenecen los estudiantes';

-- Volcando datos para la tabla bienestarcun.facultad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.facultadusuario
CREATE TABLE IF NOT EXISTS `facultadusuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` bigint(15) NOT NULL,
  `Facultad` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__usuarios` (`Usuario`),
  KEY `FK__facultad` (`Facultad`),
  CONSTRAINT `FK__facultad` FOREIGN KEY (`Facultad`) REFERENCES `facultad` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK__usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se relacionan los usuarios con la facultades a la que pertenecen';

-- Volcando datos para la tabla bienestarcun.facultadusuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facultadusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultadusuario` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.historiallaboral
CREATE TABLE IF NOT EXISTS `historiallaboral` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Empresa` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Cargo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date DEFAULT NULL,
  `LaboralEgresado` bigint(15) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_historiallaboral_laboralegresado` (`LaboralEgresado`),
  CONSTRAINT `FK_historiallaboral_laboralegresado` FOREIGN KEY (`LaboralEgresado`) REFERENCES `laboralegresado` (`Id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se va almacenando los historiales laborales de los egresados, empleos que ha tenido, lugar donde labora actualmente etc.';

-- Volcando datos para la tabla bienestarcun.historiallaboral: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `historiallaboral` DISABLE KEYS */;
INSERT INTO `historiallaboral` (`Id`, `Empresa`, `Cargo`, `FechaInicio`, `FechaFin`, `LaboralEgresado`) VALUES
	(1, 'aikon', 'programador', '2015-05-03', '0000-00-00', 1104379),
	(2, 'parque', 'programador', '2014-12-02', '2015-11-02', 1104379),
	(3, 'ott', 'auxiliar sistemas', '2014-09-03', '2015-12-02', 1104379),
	(4, 'ff ffff', 'sfdfdf dfsdfsdf', '2013-12-03', '2014-12-03', 1104379);
/*!40000 ALTER TABLE `historiallaboral` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.itinerarios
CREATE TABLE IF NOT EXISTS `itinerarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Actividad` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Detalle` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Ciclo` int(10) NOT NULL COMMENT 'campo aumentado cada 6 meses para distinguir los semestres',
  `Estado` varchar(3) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '111' COMMENT 'cumplido, cancelado, aplazado etc',
  `Circulo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran el itinerario de cada uno de los circulos, como las clases que se llevaran a cabo.';

-- Volcando datos para la tabla bienestarcun.itinerarios: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerarios` DISABLE KEYS */;
INSERT INTO `itinerarios` (`id`, `Actividad`, `Detalle`, `Fecha`, `Ciclo`, `Estado`, `Circulo`) VALUES
	(1, 'Reunion', 'Se realizara reúnion mañana de los integrantes', '2015-12-04 00:00:00', 1, '111', 1),
	(2, 'reunion el martes', 'sdsd dsdad asda dasd', '0000-00-00 00:00:00', 0, '000', 1),
	(3, 'reunion el martes', 'sdsd dsdad asda dasd', '2015-12-03 16:35:00', 0, '111', 1),
	(4, 'reunion el martes', 'sdsd dsdad asda dasd', '2015-12-03 16:35:00', 0, '111', 1),
	(5, 'reunion el viernes', 'aaaaa aaaaa aaaa aaa', '2015-11-04 10:20:00', 0, '111', 1),
	(6, 'fffff', 'fff fffffff ffff', '2015-11-04 10:24:00', 0, '111', 1),
	(7, 'yyyyy ', 'yyyyyy yyyy yyyy', '2015-12-04 10:26:00', 0, '111', 1),
	(8, 'aaaaaaa', 'yyyyyy', '2015-12-04 00:00:00', 1, '111', 1),
	(9, 'Uuuuu', 'Jjjjj', '2015-12-05 08:50:00', 0, '111', 1),
	(10, 'reunion', 'reunion de musica', '2015-12-13 09:37:00', 0, '111', 1),
	(11, 'fffffhhhhhhh', 'hhhhhhh', '2015-12-31 00:00:00', 0, '111', 8),
	(12, 'jjjjjkkkk', 'kkkkkkkk', '2015-12-31 00:00:00', 0, '111', 5),
	(13, 'oooolllll', 'lllllll', '2015-12-31 00:00:00', 0, '111', 4),
	(14, 'Itinerario de ejempl', 'Nuevo itinerario de ejemplo mus?ca ', '2017-07-06 17:30:00', 0, '111', 1);
/*!40000 ALTER TABLE `itinerarios` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.laboralegresado
CREATE TABLE IF NOT EXISTS `laboralegresado` (
  `Id` bigint(15) NOT NULL,
  `Laborando` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_laboralegresado_usuarios` FOREIGN KEY (`Id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el estado laboral del egresado, ademas esta tabla sera la relacion entre el usuario y el historial laboral de los egresados';

-- Volcando datos para la tabla bienestarcun.laboralegresado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `laboralegresado` DISABLE KEYS */;
INSERT INTO `laboralegresado` (`Id`, `Laborando`) VALUES
	(1104379, 1);
/*!40000 ALTER TABLE `laboralegresado` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario` bigint(15) NOT NULL,
  `Token` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Token` (`Token`),
  KEY `FK_Logs_usuarios` (`Usuario`),
  CONSTRAINT `FK_Logs_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacena el historial de logs por los usuarios';

-- Volcando datos para la tabla bienestarcun.logs: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`Id`, `Fecha`, `Usuario`, `Token`, `Estado`) VALUES
	(87, '2015-12-03 23:17:25', 1104379, '7a2d82b06003e1980d52e9f51ae060bec914de2f', 0),
	(88, '2015-12-03 23:32:08', 1104379, '8c7ec2300fc774ce76054d441c27b6ccc4d88052', 0),
	(89, '2015-12-03 23:32:53', 1104379, '9254ed07993084fed57c03aff3f1db52652c41fd', 1),
	(90, '2015-12-04 12:55:27', 1104379, '3a2e3e7760658b850d176405052c0dddcc83c3f0', 1),
	(91, '2015-12-09 14:40:36', 4, '9c0186f769438bb44da2ab083e2b9bc58fdf3942', 1),
	(92, '2016-05-10 11:53:17', 8, 'f95a364d45e0cade49582fda68f2faa72ef52a4f', 1),
	(93, '2016-05-10 11:56:05', 1104379, 'c20d512ce81b4a70a952e53ca0f53068f7d9129d', 0),
	(94, '2016-05-10 12:01:34', 7, '2b5e2f431b7a710912fc5477a392a301c8b67751', 1),
	(95, '2016-05-15 14:18:35', 1104379, '999159ff482a6d0c8d0dd1f8e8c3d24e009cef3c', 1),
	(96, '2016-05-16 11:28:45', 1104379, '50ce930298bb02ae8da988278e1409465467bfd7', 1),
	(97, '2016-05-16 19:32:17', 1104379, 'b53cd7e6261dda95c43910e840b71eabc2ad96b1', 0),
	(98, '2016-05-16 23:19:42', 7, '02a9cc804376eeaa08957c510fc0c53604826dc5', 1),
	(99, '2016-06-21 14:48:31', 7, 'cb83b21489b81bfdaee20fdd6684d9889c5d7eb2', 0),
	(100, '2016-06-21 18:16:42', 6, 'ad9faa1aa737d26adb84802bd824d88bc5edb4df', 0),
	(101, '2016-06-25 20:53:32', 1104379, '7f4aad4b3902899fb71392b349a0fc040388f553', 1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.logsfails
CREATE TABLE IF NOT EXISTS `logsfails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `User` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_LogsFails_usuarios` (`Usuario`),
  CONSTRAINT `FK_LogsFails_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los intentos fallidos en el proceso de login ';

-- Volcando datos para la tabla bienestarcun.logsfails: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `logsfails` DISABLE KEYS */;
INSERT INTO `logsfails` (`Id`, `User`, `Password`, `Fecha`, `Usuario`) VALUES
	(41, '1104379', 'hh', '2015-12-03 23:17:13', 1104379),
	(42, '1104379214', '8', '2015-12-03 23:31:58', NULL),
	(43, '1104', 'sadmin', '2016-05-10 11:51:43', 8),
	(44, '1104', 'sadmin', '2016-05-10 11:52:01', 8),
	(45, '1104', 'sadmin', '2016-05-10 11:52:29', 8),
	(46, '1104', 'admin', '2016-05-10 11:52:51', 8),
	(47, '1104', '41', '2016-05-10 11:54:08', 8),
	(48, '1104', '41', '2016-05-10 11:54:10', 8),
	(49, '1104379', '8', '2016-05-15 14:17:19', NULL),
	(50, '1104379', 'sadmin', '2016-05-15 14:17:33', NULL),
	(51, '1104', 'sadmin', '2016-05-15 14:17:53', NULL);
/*!40000 ALTER TABLE `logsfails` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.notificaciones
CREATE TABLE IF NOT EXISTS `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Notificacion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` varchar(3) COLLATE utf8_spanish2_ci NOT NULL,
  `Circulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notificaciones_circulos` (`Circulo`),
  CONSTRAINT `FK_notificaciones_circulos` FOREIGN KEY (`Circulo`) REFERENCES `circulos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Mensajes creados por el o los administradores del circulo, para los usuarios inscritos al circulo';

-- Volcando datos para la tabla bienestarcun.notificaciones: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` (`id`, `Notificacion`, `Fecha`, `Estado`, `Circulo`) VALUES
	(1, 'Reunion el viernes por la tarde para evento', '2015-11-27 00:00:00', '111', 1),
	(2, 'nueva reunion el sabado', '2015-11-28 00:00:00', '110', 1),
	(3, 'Nueva reunion danza el sabado', '2015-11-28 00:00:00', '111', 1),
	(4, 'se creado una nueva fecha para la reunion', '2015-11-30 00:00:00', '111', 1),
	(5, 'ndfjsfjndssfjsdf sfsdf sdifjisdjfsdf', '2015-11-23 00:00:00', '111', 1),
	(6, 'clase de musica el viernes', '2015-12-04 00:00:00', '111', 1),
	(7, 'aaaaaaa yyyyyy', '2015-12-04 00:00:00', '111', 1),
	(8, 'Uuuuu Jjjjj', '2015-12-05 08:50:00', '111', 1),
	(9, 'reunion reunion de musica', '2015-12-13 09:37:00', '111', 1),
	(10, 'fffffhhhhhhh hhhhhhh', '2015-12-31 00:00:00', '111', 8),
	(11, 'jjjjjkkkk kkkkkkkk', '2015-12-31 00:00:00', '111', 5),
	(12, 'oooolllll lllllll', '2015-12-31 00:00:00', '111', 4),
	(13, 'encuentro de talento', '2016-06-22 16:12:47', '111', 18),
	(14, 'Itinerario de ejempl Nuevo itinerario de ejemplo mus?ca ', '2017-07-06 17:30:00', '111', 1);
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `Identificacion` bigint(15) NOT NULL COMMENT 'Cedulas',
  `TipoId` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombres` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellidos` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `#Contacto` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Telefonos, celulares etc',
  `Email` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Sexo` enum('M','F') COLLATE utf8_spanish2_ci NOT NULL COMMENT 'M,F',
  `Edad` int(3) NOT NULL,
  `Sede` int(11) NOT NULL,
  PRIMARY KEY (`Identificacion`),
  KEY `FK_personas_sede` (`Sede`),
  CONSTRAINT `FK_personas_sede` FOREIGN KEY (`Sede`) REFERENCES `sede` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='En esta tabla se almacenaran los datos que poseen cualquier personas';

-- Volcando datos para la tabla bienestarcun.personas: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` (`Identificacion`, `TipoId`, `Nombres`, `Apellidos`, `#Contacto`, `Email`, `Direccion`, `Sexo`, `Edad`, `Sede`) VALUES
	(2, 'cc', 'admin', 'admin', '222', 'adasd', 'sdads', 'M', 12, 1),
	(3, 'CC', 'admin', 'circle', '222', 'dddd', 'dddd', 'M', 23, 1),
	(4, 'cc', 'docente', 'docente', '2233', 'dsd', 'adsasd', 'M', 23, 1),
	(5, 'CC', 'estudiante', 'estudiante', '3424', 'dfsf', 'sfsdf', 'M', 23, 1),
	(6, 'cc', 'egresado', 'egresado', '3243', 'dfsdf', 'fsdfdf', 'M', 25, 1),
	(7, 'cc', 'psicologo', 'psicologo', '4544', 'fdgdfg', 'fgdg', 'M', 23, 1),
	(8, 'cc', 'andrea', 'gomez', '23423', 'dffsdfd', 'sdfsf', 'M', 34, 1),
	(41, 'cc', 'docente2', 'docente2', '3434434', 'sdfdf@dfdf', 'sincelejo', 'M', 35, 1),
	(1234, 'cc', 'pedro', 'perez', '-', '-', '-', 'M', 23, 5),
	(12345, 'CC', 'pedro', 'perez', '28145654', 'ddd@ddd.com', 'sincelejo', 'M', 23, 1),
	(55244, 'CC', 'default', 'default', '-', '-', '-', 'M', 0, 2),
	(1104379, 'CC', 'carlos', 'guzman', '300866', 'ss@dd.com', '20 julio', 'M', 24, 1),
	(1000000000, 'cc', 'default', 'default', '0', '-', '-', 'M', 0, 1),
	(6000000000, 'CC', 'default', 'default', '-', '-', '-', 'M', 0, 6);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.sede
CREATE TABLE IF NOT EXISTS `sede` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Departamento` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Ciudad` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `Encargado` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se registran la diferentes sedes de la universidad';

-- Volcando datos para la tabla bienestarcun.sede: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` (`id`, `Nombre`, `Departamento`, `Ciudad`, `Direccion`, `Telefono`, `Encargado`) VALUES
	(1, 'sincelejo', 'Sucre', 'Sincelejo', 'centro', '2811280', 'Maria'),
	(3, 'bogota', 'bogota', 'bogota', 'centro', '280000', 'Pedro'),
	(6, 'monteria', 'cordoba', 'monteria', 'centro', '2820000', 'juan');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.usuariocirculo
CREATE TABLE IF NOT EXISTS `usuariocirculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` bigint(15) NOT NULL,
  `Circulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UsuarioCirculo_usuarios` (`Usuario`),
  KEY `FK_usuariocirculo_circulos` (`Circulo`),
  CONSTRAINT `FK_UsuarioCirculo_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_usuariocirculo_circulos` FOREIGN KEY (`Circulo`) REFERENCES `circulos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran las relaciones entre los usuario y los circulos a los que pertenecen';

-- Volcando datos para la tabla bienestarcun.usuariocirculo: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariocirculo` DISABLE KEYS */;
INSERT INTO `usuariocirculo` (`id`, `Usuario`, `Circulo`) VALUES
	(3, 1104379, 1),
	(4, 8, 1),
	(7, 4, 8),
	(10, 1104379, 4),
	(11, 2, 4),
	(12, 3, 4),
	(13, 4, 4),
	(14, 5, 4),
	(15, 6, 4),
	(16, 7, 4),
	(17, 8, 4),
	(20, 1000000000, 4),
	(24, 6000000000, 24),
	(26, 41, 9),
	(27, 41, 4);
/*!40000 ALTER TABLE `usuariocirculo` ENABLE KEYS */;


-- Volcando estructura para tabla bienestarcun.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(15) NOT NULL COMMENT 'Campo relacion con el resto de los datos',
  `User` varchar(20) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'nombre de usuario',
  `Password` varchar(20) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'contraseña de acceso',
  `Tipo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'permisos del usuario',
  `Estado` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'activo, inactivo, bloqueado etc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_Password` (`User`,`Password`),
  CONSTRAINT `FK_usuarios_personas` FOREIGN KEY (`id`) REFERENCES `personas` (`Identificacion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran aquellas personas que creen un usuario en el sistema, para acceder a funcionalidades espeficificas';

-- Volcando datos para la tabla bienestarcun.usuarios: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `User`, `Password`, `Tipo`, `Estado`) VALUES
	(2, 'admin', 'admin', '1110', '1'),
	(3, 'circle', 'circle', '1101', '1'),
	(4, 'docente', 'docente', '1100', '1'),
	(5, 'éstudiante', 'estudiante', '1011', '1'),
	(6, 'egresado', 'egresado', '1010', '1'),
	(7, 'psicologo', 'psicologo', '1001', '1'),
	(8, '9', '1', '1000', '1'),
	(41, 'docente2', 'docente2', '1101', '1'),
	(1234, 'egresado1', 'egresado', '1010', '1'),
	(1104379, 'sadmin', 'sadmin', '1111', '1'),
	(1000000000, '--', '--', '1000', '1'),
	(6000000000, 'usuario6', 'usuario6', '1000', '1');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Volcando estructura para procedimiento bienestarcun.VincularUsuarioCircleDefault
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `VincularUsuarioCircleDefault`(IN `tipoUsuario` VARCHAR(10), IN `idUsuario` BIGINT(15) )
BEGIN 
	
	DECLARE idCircle int(11); 
	DECLARE idCirclePublic int(11); 
	DECLARE sedeUser int(11);

	SELECT Sede INTO sedeUser  FROM personas WHERE Identificacion = idUsuario;

	IF tipoUsuario = '1000' THEN    

		SELECT Id INTO idCircle  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);   

	ELSEIF tipoUsuario = '1001' THEN      

		SELECT Id INTO idCircle FROM circulos WHERE Nombre LIKE '%Psicologa%' AND Sede = sedeUser LIMIT 1;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);

		SELECT Id INTO idCirclePublic  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCirclePublic);

	ELSEIF tipoUsuario = '1010' THEN    

		SELECT Id INTO idCircle FROM circulos WHERE Nombre LIKE '%Egresados%' AND Sede = sedeUser LIMIT 1;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);

		SELECT Id INTO idCirclePublic  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCirclePublic);

	ELSEIF tipoUsuario = '1011' THEN   

		SELECT Id INTO idCircle FROM circulos WHERE Nombre LIKE '%Estudiantes%' AND Sede = sedeUser LIMIT 1;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);  

		SELECT Id INTO idCirclePublic  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCirclePublic);  

	ELSEIF tipoUsuario = '1100' THEN     

		SELECT Id INTO idCircle FROM circulos WHERE Nombre LIKE '%Docentes%' AND Sede = sedeUser LIMIT 1;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);

		SELECT Id INTO idCirclePublic  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCirclePublic);

	ELSEIF tipoUsuario = '1101' THEN   

		SELECT Id INTO idCircle FROM circulos WHERE Nombre LIKE '%Tutores bienestar%' AND Sede = sedeUser LIMIT 1;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCircle);

		SELECT Id INTO idCirclePublic  FROM circulos WHERE Nombre LIKE '%Publico%' AND Sede = sedeUser LIMIT 1 ;
		INSERT INTO usuariocirculo(Usuario, Circulo) VALUES(idUsuario, idCirclePublic);

	END IF;
END//
DELIMITER ;


-- Volcando estructura para disparador bienestarcun.addNewNotificationItinerario
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `addNewNotificationItinerario` AFTER INSERT ON `itinerarios` FOR EACH ROW begin

	INSERT INTO notificaciones(Notificacion,Fecha, Estado, Circulo)
	VALUES(CONCAT(new.Actividad," ",new.Detalle), new.Fecha, "111", new.Circulo );


end//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Volcando estructura para disparador bienestarcun.CreateFileDefault
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `CreateFileDefault` AFTER INSERT ON `sede` FOR EACH ROW BEGIN
	call CreateFileDefaultProcedure( new.id );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Volcando estructura para disparador bienestarcun.DelUsuarioCircle
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `DelUsuarioCircle` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
	call DelUsuarioCircleProcedure( old.id );
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Volcando estructura para disparador bienestarcun.TriggerVincularUsuarioCircleDefault
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `TriggerVincularUsuarioCircleDefault` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
	call VincularUsuarioCircleDefault(new.Tipo, new.Id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
