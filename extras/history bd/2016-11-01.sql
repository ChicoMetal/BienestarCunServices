-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
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

-- Volcando datos para la tabla bienestarcun.asistencias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` (`id`, `Presencia`, `Fecha`, `Usuario`, `Itinerario`) VALUES
	(5, '111', '2016-10-25 21:10:09', 6, 23),
	(6, '111', '2016-10-25 21:10:09', 1104379, 23),
	(7, '000', '2016-10-25 21:10:09', 2, 23),
	(8, '000', '2016-10-25 21:10:09', 8, 23);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los mensajes dirijidos a la psicologa';

-- Volcando datos para la tabla bienestarcun.chatpsicologia: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `chatpsicologia` DISABLE KEYS */;
INSERT INTO `chatpsicologia` (`Id`, `Mensaje`, `Fecha`, `Estado`, `Remitente`, `Destinatario`) VALUES
	(1, 'hola', '2016-10-07 00:12:48', 1, 1104379, 7),
	(2, 'hola', '2016-10-07 00:13:06', 1, 7, 1104379),
	(3, 'como esta', '2016-10-07 00:13:15', 1, 1104379, 7),
	(4, 'bn y tu', '2016-10-07 00:13:21', 1, 7, 1104379),
	(5, 'bn bn', '2016-10-07 00:13:40', 1, 1104379, 7),
	(6, 'q bueno :)', '2016-10-07 00:13:48', 1, 7, 1104379),
	(7, 'hola', '2016-10-21 17:13:47', 1, 1104379, 7),
	(8, 'hola', '2016-10-21 17:14:25', 1, 7, 1104379),
	(9, 'hola', '2016-10-21 17:34:31', 1, 1104379, 7),
	(10, 'holap', '2016-10-21 17:34:41', 1, 7, 1104379),
	(11, 'hola', '2016-10-25 20:35:03', 1, 1104379, 7),
	(12, 'hola', '2016-10-25 20:36:10', 1, 7, 1104379),
	(13, 'como estas', '2016-10-25 20:36:38', 1, 7, 1104379),
	(14, 'hola', '2016-10-25 20:40:37', 1, 1104379, 7),
	(15, 'hola', '2016-10-25 20:45:40', 1, 7, 1104379),
	(16, 'hola', '2016-10-25 20:49:52', 1, 1104379, 7),
	(17, 'hola', '2016-10-25 20:50:01', 1, 7, 1104379),
	(18, 'como esta', '2016-10-25 20:50:06', 1, 1104379, 7),
	(19, 'bn y tu', '2016-10-25 20:50:14', 1, 7, 1104379);
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
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla bienestarcun.depuracion: ~94 rows (aproximadamente)
/*!40000 ALTER TABLE `depuracion` DISABLE KEYS */;
INSERT INTO `depuracion` (`Id`, `Contenido`, `Fecha`) VALUES
	(44, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 17:01:27'),
	(45, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 17:01:50'),
	(46, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 18:42:29'),
	(47, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 18:47:02'),
	(48, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 18:47:38'),
	(49, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 18:49:25'),
	(50, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-10-26 19:15:55'),
	(51, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 37#!#', '2016-10-26 19:16:30'),
	(52, 'Error desde php #!# Error: json_decode() expects parameter 1 to be string, array given#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-10-26 19:17:25'),
	(53, 'Error desde php #!# Error: Undefined offset: 0#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-10-26 19:18:03'),
	(54, 'Error desde php #!# Error: Undefined offset: 1#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-10-26 19:18:13'),
	(55, 'Error desde php #!# Error: Undefined offset: 1#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-10-26 19:43:07'),
	(56, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 37#!#', '2016-10-26 19:43:33'),
	(57, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 26#!#', '2016-10-26 19:44:03'),
	(58, 'Error desde php #!# Error: basename() expects parameter 1 to be string, array given#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 26#!#', '2016-10-26 19:52:26'),
	(59, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 28#!#', '2016-10-26 19:53:13'),
	(60, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 19:53:27'),
	(61, 'Error desde php #!# Error: json_decode() expects parameter 1 to be string, array given#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 27#!#', '2016-10-26 19:53:57'),
	(62, 'Error desde php #!# Error: Object of class stdClass could not be converted to string#!#Tipo: 4096#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 28#!#', '2016-10-26 19:54:13'),
	(63, 'Error desde php #!# Error: Undefined offset: 0#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 27#!#', '2016-10-26 19:54:53'),
	(64, 'Error desde php #!# Error: json_decode() expects parameter 1 to be string, array given#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 27#!#', '2016-10-26 19:56:54'),
	(65, 'Error desde php #!# Error: json_decode() expects parameter 1 to be string, array given#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 27#!#', '2016-10-26 19:57:17'),
	(66, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 20:14:17'),
	(67, 'Error desde php #!# Error: Undefined index: picture#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 27#!#', '2016-10-26 20:17:37'),
	(68, 'Error desde php #!# Error: Undefined index: fotoUp#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 17#!#', '2016-10-26 20:21:35'),
	(69, 'Error desde php #!# Error: Undefined variable: user#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 18#!#', '2016-10-26 21:04:47'),
	(70, 'Error desde php #!# Error: Undefined variable: user#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 18#!#', '2016-10-26 21:05:00'),
	(71, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroiduserlogin.php#!#linea: 30#!#', '2016-10-27 15:49:26'),
	(72, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:49:42'),
	(73, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:49:42'),
	(74, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:49:42'),
	(75, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:49:42'),
	(76, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:49:42'),
	(77, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:49:43'),
	(78, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:49:50'),
	(79, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:49:50'),
	(80, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:49:51'),
	(81, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:49:51'),
	(82, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:49:52'),
	(83, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:49:56'),
	(84, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:49:57'),
	(85, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:49:57'),
	(86, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:49:57'),
	(87, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:50:17'),
	(88, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:50:17'),
	(89, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:50:28'),
	(90, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:50:28'),
	(91, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:50:35'),
	(92, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:50:50'),
	(93, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:50:50'),
	(94, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:18'),
	(95, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:18'),
	(96, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:18'),
	(97, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:28'),
	(98, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:28'),
	(99, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:28'),
	(100, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:39'),
	(101, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:40'),
	(102, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:40'),
	(103, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:40'),
	(104, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:40'),
	(105, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:40'),
	(106, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:40'),
	(107, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:40'),
	(108, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:40'),
	(109, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:40'),
	(110, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:40'),
	(111, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:40'),
	(112, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:40'),
	(113, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:41'),
	(114, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:41'),
	(115, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:41'),
	(116, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:41'),
	(117, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:41'),
	(118, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:41'),
	(119, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:41'),
	(120, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:41'),
	(121, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:41'),
	(122, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:41'),
	(123, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:41'),
	(124, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:57'),
	(125, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:57'),
	(126, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:57'),
	(127, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:58'),
	(128, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:58'),
	(129, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:58'),
	(130, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:58'),
	(131, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:58'),
	(132, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:58'),
	(133, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:53:58'),
	(134, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:53:58'),
	(135, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-10-27 15:53:58'),
	(136, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-10-27 15:54:03'),
	(137, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-10-27 15:54:03'),
	(138, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:33:30'),
	(139, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:33:33'),
	(140, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:01'),
	(141, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:02'),
	(142, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:02'),
	(143, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:25'),
	(144, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:25'),
	(145, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:25'),
	(146, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:25'),
	(147, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:25'),
	(148, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:25'),
	(149, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:26'),
	(150, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:26'),
	(151, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:26'),
	(152, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:26'),
	(153, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:26'),
	(154, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:26'),
	(155, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:26'),
	(156, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:26'),
	(157, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:26'),
	(158, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 16:35:27'),
	(159, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:27'),
	(160, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:27'),
	(161, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 16:35:27'),
	(162, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 16:35:27'),
	(163, 'Error desde android #!# Funcion: ProcedureConfirmLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#Can not perform this action after onSaveInstanceState', '2016-11-01 16:56:28'),
	(164, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:36'),
	(165, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:36'),
	(166, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:36'),
	(167, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:40'),
	(168, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:40'),
	(169, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:40'),
	(170, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:40'),
	(171, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:40'),
	(172, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:40'),
	(173, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:41'),
	(174, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:41'),
	(175, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:41'),
	(176, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:41'),
	(177, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:41'),
	(178, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:41'),
	(179, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:41'),
	(180, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:41'),
	(181, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:41'),
	(182, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:41'),
	(183, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:41'),
	(184, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:41'),
	(185, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:42'),
	(186, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:42'),
	(187, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:42'),
	(188, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:42'),
	(189, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:42'),
	(190, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:42'),
	(191, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:42'),
	(192, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:42'),
	(193, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:42'),
	(194, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:42'),
	(195, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:42'),
	(196, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:42'),
	(197, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:42'),
	(198, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:42'),
	(199, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:42'),
	(200, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:43'),
	(201, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:43'),
	(202, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:43'),
	(203, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:43'),
	(204, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:43'),
	(205, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:43'),
	(206, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:43'),
	(207, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:43'),
	(208, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:43'),
	(209, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:44'),
	(210, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:44'),
	(211, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:44'),
	(212, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:44'),
	(213, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:44'),
	(214, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:44'),
	(215, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:44'),
	(216, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:44'),
	(217, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:44'),
	(218, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:44'),
	(219, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:44'),
	(220, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:44'),
	(221, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:45'),
	(222, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:45'),
	(223, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:45'),
	(224, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:45'),
	(225, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:45'),
	(226, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:45'),
	(227, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:45'),
	(228, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:45'),
	(229, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:45'),
	(230, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:53'),
	(231, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:53'),
	(232, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:53'),
	(233, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:53'),
	(234, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:53'),
	(235, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:53'),
	(236, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:53'),
	(237, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:53'),
	(238, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:53'),
	(239, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:53'),
	(240, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:53'),
	(241, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:53'),
	(242, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(243, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(244, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(245, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(246, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(247, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(248, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(249, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(250, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(251, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(252, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(253, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(254, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(255, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(256, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(257, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(258, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(259, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(260, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(261, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(262, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(263, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:54'),
	(264, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:54'),
	(265, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:54'),
	(266, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(267, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:55'),
	(268, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(269, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(270, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(271, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:55'),
	(272, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(273, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(274, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:55'),
	(275, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(276, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(277, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:55'),
	(278, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(279, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(280, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:55'),
	(281, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:55'),
	(282, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:55'),
	(283, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:56'),
	(284, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:56'),
	(285, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:56'),
	(286, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:56'),
	(287, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:56'),
	(288, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:56'),
	(289, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:56'),
	(290, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:56'),
	(291, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:56'),
	(292, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:56'),
	(293, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:57'),
	(294, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:57'),
	(295, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:57'),
	(296, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:57'),
	(297, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:57'),
	(298, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:57'),
	(299, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:58'),
	(300, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:58'),
	(301, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:58'),
	(302, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:58'),
	(303, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:58'),
	(304, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:58'),
	(305, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:02:59'),
	(306, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:02:59'),
	(307, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:02:59'),
	(308, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:00'),
	(309, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:00'),
	(310, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:00'),
	(311, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:00'),
	(312, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:00'),
	(313, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:00'),
	(314, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:00'),
	(315, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:00'),
	(316, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:00'),
	(317, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:00'),
	(318, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:00'),
	(319, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:00'),
	(320, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:00'),
	(321, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:00'),
	(322, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(323, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:01'),
	(324, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:01'),
	(325, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(326, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:01'),
	(327, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:01'),
	(328, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(329, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:01'),
	(330, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:01'),
	(331, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(332, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:01'),
	(333, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:01'),
	(334, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(335, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:01'),
	(336, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:01'),
	(337, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:01'),
	(338, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:02'),
	(339, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:02'),
	(340, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:02'),
	(341, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:02'),
	(342, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:02'),
	(343, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:02'),
	(344, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:02'),
	(345, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:02'),
	(346, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:02'),
	(347, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:02'),
	(348, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:02'),
	(349, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:02'),
	(350, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:02'),
	(351, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:02'),
	(352, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:02'),
	(353, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:03'),
	(354, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:03'),
	(355, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:03'),
	(356, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:03'),
	(357, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:03'),
	(358, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:03'),
	(359, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:03'),
	(360, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:03'),
	(361, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:03'),
	(362, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:03'),
	(363, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:03'),
	(364, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:03'),
	(365, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:03'),
	(366, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:03'),
	(367, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:03'),
	(368, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:04'),
	(369, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:04'),
	(370, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:04'),
	(371, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:04'),
	(372, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:04'),
	(373, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:04'),
	(374, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:04'),
	(375, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:04'),
	(376, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:04'),
	(377, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:04'),
	(378, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:04'),
	(379, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:04'),
	(380, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:05'),
	(381, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:05'),
	(382, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:05'),
	(383, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:05'),
	(384, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:05'),
	(385, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:05'),
	(386, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:05'),
	(387, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:05'),
	(388, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:05'),
	(389, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:05'),
	(390, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:05'),
	(391, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:05'),
	(392, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:06'),
	(393, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:06'),
	(394, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:06'),
	(395, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:06'),
	(396, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:06'),
	(397, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:06'),
	(398, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:06'),
	(399, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:06'),
	(400, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:06'),
	(401, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:07'),
	(402, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:07'),
	(403, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:07'),
	(404, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:07'),
	(405, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:07'),
	(406, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:07'),
	(407, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:07'),
	(408, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:07'),
	(409, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:07'),
	(410, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:07'),
	(411, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:07'),
	(412, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:07'),
	(413, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:07'),
	(414, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:07'),
	(415, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:07'),
	(416, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:08'),
	(417, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:08'),
	(418, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:08'),
	(419, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:08'),
	(420, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:08'),
	(421, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:08'),
	(422, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:08'),
	(423, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:08'),
	(424, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:08'),
	(425, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:09'),
	(426, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:09'),
	(427, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:09'),
	(428, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:09'),
	(429, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:09'),
	(430, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:09'),
	(431, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:09'),
	(432, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:09'),
	(433, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:09'),
	(434, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:10'),
	(435, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:10'),
	(436, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:10'),
	(437, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:10'),
	(438, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:10'),
	(439, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:10'),
	(440, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:10'),
	(441, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:10'),
	(442, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:10'),
	(443, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:12'),
	(444, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:12'),
	(445, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:12'),
	(446, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:12'),
	(447, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:12'),
	(448, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:12'),
	(449, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:12'),
	(450, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:12'),
	(451, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:03:12'),
	(452, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:03:40'),
	(453, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:03:40'),
	(454, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {4=Estado, 3=Tipo, 2=Password, 1=User, 0=Id} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:05:07'),
	(455, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Id=1104379, User=sadmin, Password=sadmin, Tipo=1111, Estado=1}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:05:07'),
	(456, 'Error desde android #!# Funcion: ValidateResponseLogin #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.Funciones.AdapterUserMenu.java #!#null', '2016-11-01 17:05:07'),
	(457, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:05:07'),
	(458, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:05:07'),
	(459, 'Error desde android #!# Funcion: getResults #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value [{Nombres=default, Apellidos=default}] at 0 of type java.util.ArrayList cannot be converted to JSONArray', '2016-11-01 17:05:56'),
	(460, 'Error desde android #!# Funcion: getIndex #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.WebServices.ContentResults.ResponseContent.java #!#Value {1=Apellidos, 0=Nombres} at 1 of type com.google.gson.internal.LinkedTreeMap cannot be converted to JSONObject', '2016-11-01 17:05:56'),
	(461, 'Error desde android #!# Funcion: ValidateResponse #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.ui.frragmentContent.EvidenciasActivities.java #!#No value for holaaaa', '2016-11-01 17:19:28'),
	(462, 'Error desde android #!# Funcion: ValidateResponse #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.ui.frragmentContent.EvidenciasActivities.java #!#No value for holaaaa', '2016-11-01 17:19:40'),
	(463, 'Error desde android #!# Funcion: ValidateResponse #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.ui.frragmentContent.EvidenciasActivities.java #!#No value for fff', '2016-11-01 17:20:27'),
	(464, 'Error desde php #!# Error: copy(): Filename cannot be empty#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 28#!#', '2016-11-01 21:41:08'),
	(465, 'Error desde php #!# Error: copy(): Filename cannot be empty#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 28#!#', '2016-11-01 21:41:51'),
	(466, 'Error desde php #!# Error: copy(): Filename cannot be empty#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 26#!#', '2016-11-01 21:47:36'),
	(467, 'Error desde android #!# Funcion: onActivityResult #!#Clase : com.co.edu.cun.www1104379214.bienestarcun.ui.frragmentContent.EvidenciasActivities.java #!#/sdcard/Evidencia#!#23#!#20161102_012827.jpg (No such file or directory)', '2016-11-01 22:21:42'),
	(468, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-11-01 22:28:11'),
	(469, 'Error desde php #!# Error: copy(Evidencia#!#23#!#20161102_013835.jpg): failed to open stream: No such file or directory#!#Tipo: 2#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 29#!#', '2016-11-01 22:31:53'),
	(470, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-11-01 22:32:40'),
	(471, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 37#!#', '2016-11-01 22:33:38'),
	(472, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 35#!#', '2016-11-01 22:35:13'),
	(473, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:36:25'),
	(474, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:37:09'),
	(475, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:42:23'),
	(476, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:42:44'),
	(477, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:43:08'),
	(478, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:43:35'),
	(479, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:44:42'),
	(480, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:45:18'),
	(481, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:45:42'),
	(482, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:46:04'),
	(483, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:46:41'),
	(484, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:47:49'),
	(485, 'Error desde php #!# Error: Undefined variable: file#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidadminCircleSaveEvidencia.php#!#linea: 33#!#', '2016-11-01 22:50:03');
/*!40000 ALTER TABLE `depuracion` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.desercion
CREATE TABLE IF NOT EXISTS `desercion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Jornada` enum('Diurno','Nocturno') COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Estado` tinyint(1) NOT NULL DEFAULT '0',
  `Facultad` int(11) NOT NULL,
  `Desertor` bigint(15) NOT NULL,
  `Usuario` bigint(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Desercion_personas` (`Desertor`),
  KEY `FK_Desercion_usuarios` (`Usuario`),
  KEY `FK_desercion_facultad` (`Facultad`),
  CONSTRAINT `FK_Desercion_personas` FOREIGN KEY (`Desertor`) REFERENCES `personas` (`Identificacion`) ON UPDATE CASCADE,
  CONSTRAINT `FK_Desercion_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_desercion_facultad` FOREIGN KEY (`Facultad`) REFERENCES `facultad` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los registros hechos por los docente por estudiantes en ausencia prolongada con posible desercion';

-- Volcando datos para la tabla bienestarcun.desercion: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `desercion` DISABLE KEYS */;
INSERT INTO `desercion` (`id`, `Descripcion`, `Jornada`, `Fecha`, `Estado`, `Facultad`, `Desertor`, `Usuario`) VALUES
	(19, 'yyyyyyyy', 'Nocturno', '2016-09-30 00:57:06', 0, 1, 5, 1104379),
	(20, 'no se ha presentado a clases en 4 dias', 'Nocturno', '2016-09-30 01:02:56', 0, 1, 5, 1104379),
	(21, 'jjjjj', 'Nocturno', '2016-10-06 22:49:49', 0, 1, 1104379, 1104379),
	(22, 'no viene a clases', 'Nocturno', '2016-10-06 23:47:34', 0, 1, 1104379, 1104379),
	(23, 'no llega', 'Nocturno', '2016-10-20 22:05:48', 0, 1, 1104379, 1104379),
	(25, 'no se ha presentado', 'Nocturno', '2016-10-25 16:23:50', 0, 1, 1104379, 1104379);
/*!40000 ALTER TABLE `desercion` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.evidencias
CREATE TABLE IF NOT EXISTS `evidencias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `NombreArchivo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Ruta` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Itinerario` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `NombreArchivo` (`NombreArchivo`),
  KEY `FK_Evidencias_itinerarios` (`Itinerario`),
  CONSTRAINT `FK_Evidencias_itinerarios` FOREIGN KEY (`Itinerario`) REFERENCES `itinerarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran la informacion de los archivos subidos por los administradores de los circulos, ubicacion, nombre del archivo etc.';

-- Volcando datos para la tabla bienestarcun.evidencias: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
INSERT INTO `evidencias` (`Id`, `Nombre`, `NombreArchivo`, `Ruta`, `Fecha`, `Itinerario`) VALUES
	(44, 'imagenEvidencia', 'C:xampp	mpphpA56F.tmp', '/evidencias', '2016-11-01 22:36:24', 23),
	(45, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161102_014351.jpg', '/evidencias', '2016-11-01 22:37:09', 23),
	(46, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224216.jpg', '/evidencias', '2016-11-01 22:42:23', 23),
	(47, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224245.jpg', '/evidencias', '2016-11-01 22:42:44', 23),
	(48, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224309.jpg', '/evidencias', '2016-11-01 22:43:08', 23),
	(49, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224336.jpg', '/evidencias', '2016-11-01 22:43:35', 23),
	(50, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224417.jpg', '/evidencias', '2016-11-01 22:44:42', 23),
	(51, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224512.jpg', '/evidencias', '2016-11-01 22:45:18', 23),
	(52, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224542.jpg', '/evidencias', '2016-11-01 22:45:42', 23),
	(53, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224605.jpg', '/evidencias', '2016-11-01 22:46:04', 23),
	(54, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224626.jpg', '/evidencias', '2016-11-01 22:46:41', 23),
	(55, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224707.jpg', '/evidencias', '2016-11-01 22:47:48', 23),
	(56, 'imagenEvidencia', './evidencias/Evidencia#!#23#!#20161101_224951.jpg', '/evidencias', '2016-11-01 22:50:03', 23);
/*!40000 ALTER TABLE `evidencias` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.facultad
CREATE TABLE IF NOT EXISTS `facultad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Facultad` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se registraran las facultades a las q pertenecen los estudiantes';

-- Volcando datos para la tabla bienestarcun.facultad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` (`id`, `Facultad`, `Estado`) VALUES
	(1, 'Ingenieria', 1),
	(2, 'Administracion', 1);
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.facultadusuario
CREATE TABLE IF NOT EXISTS `facultadusuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` bigint(15) NOT NULL,
  `Facultad` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__usuarios` (`Usuario`),
  KEY `FK_facultadusuario_facultad` (`Facultad`),
  CONSTRAINT `FK__usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_facultadusuario_facultad` FOREIGN KEY (`Facultad`) REFERENCES `facultad` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se relacionan los usuarios con la facultades a la que pertenecen';

-- Volcando datos para la tabla bienestarcun.facultadusuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `facultadusuario` DISABLE KEYS */;
INSERT INTO `facultadusuario` (`Id`, `Usuario`, `Facultad`) VALUES
	(4, 5, 1),
	(5, 6, 1),
	(7, 1234, 1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se va almacenando los historiales laborales de los egresados, empleos que ha tenido, lugar donde labora actualmente etc.';

-- Volcando datos para la tabla bienestarcun.historiallaboral: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historiallaboral` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `FK_itinerarios_circulos` (`Circulo`),
  CONSTRAINT `FK_itinerarios_circulos` FOREIGN KEY (`Circulo`) REFERENCES `circulos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran el itinerario de cada uno de los circulos, como las clases que se llevaran a cabo.';

-- Volcando datos para la tabla bienestarcun.itinerarios: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerarios` DISABLE KEYS */;
INSERT INTO `itinerarios` (`id`, `Actividad`, `Detalle`, `Fecha`, `Ciclo`, `Estado`, `Circulo`) VALUES
	(1, 'Reunion', 'Se realizara reúnion mañana de los integrantes', '2015-12-04 00:00:00', 1, '000', 1),
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
	(14, 'Ejemplo', 'Nuevo itinerario de ejemplo musíca ', '2017-07-06 17:30:00', 0, '000', 1),
	(15, 'Presentacion', 'presentacion grupo musica', '2016-12-25 17:41:51', 1, '111', 4),
	(18, 'ttt', 'ttttt', '0000-00-00 00:00:00', 0, '111', 1),
	(19, 'ttt', 'ttttt', '0000-00-00 00:00:00', 0, '111', 1),
	(20, 'aaaaaa', 'aaaaaaa', '2016-09-29 21:20:00', 0, '111', 1),
	(21, 'gggggg', 'gggggggg', '2016-09-29 21:30:00', 0, '111', 1),
	(22, 'clases', 'clases guitarra', '2017-10-05 08:58:00', 0, '000', 1),
	(23, 'Clase', 'Clase de mucíca', '2016-11-07 14:34:00', 0, '111', 1),
	(24, 'Clases', 'Reunion del grupó, para ajustar detalles de la presentacion', '2016-10-07 16:19:00', 0, '111', 1),
	(25, 'actividád', 'actividad de bienestar, presentaciones', '2016-10-20 20:30:00', 0, '111', 1),
	(28, 'ctividad3', 'actividad3', '2016-10-25 20:38:00', 0, '000', 1),
	(31, 'ejemplo', 'ejemplo', '2016-10-26 09:00:00', 0, '000', 1);
/*!40000 ALTER TABLE `itinerarios` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.laboralegresado
CREATE TABLE IF NOT EXISTS `laboralegresado` (
  `Id` bigint(15) NOT NULL,
  `Laborando` tinyint(1) NOT NULL DEFAULT '0',
  `FechaCreate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaUpdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_laboralegresado_usuarios` FOREIGN KEY (`Id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el estado laboral del egresado, ademas esta tabla sera la relacion entre el usuario y el historial laboral de los egresados';

-- Volcando datos para la tabla bienestarcun.laboralegresado: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `laboralegresado` DISABLE KEYS */;
INSERT INTO `laboralegresado` (`Id`, `Laborando`, `FechaCreate`, `FechaUpdate`) VALUES
	(1104379, 1, '2016-10-20 23:38:13', '2016-10-25 16:34:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacena el historial de logs por los usuarios';

-- Volcando datos para la tabla bienestarcun.logs: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`Id`, `Fecha`, `Usuario`, `Token`, `Estado`) VALUES
	(155, '2016-10-26 21:09:17', 1104379, 'c26a9480b1f42f2f6d0e46a589c3b355180d9a26', 1),
	(156, '2016-10-26 21:24:16', 1104379, '33e51fdb92910b17c7953016619499c3f728e60a', 0),
	(157, '2016-10-26 22:09:31', 1104379, 'f18462e8934fdaee4ed79a6189ae97c1ff3c950f', 1),
	(158, '2016-11-01 16:56:28', 1104379, 'ab5111e33637703aad8dc22e542b24afb25d62ed', 0),
	(159, '2016-11-01 16:57:15', 1104379, '0fcab63d6a6ef04aa3d5e9f8235465832a15431e', 1),
	(160, '2016-11-01 20:27:24', 1104379, '62f60e8d719791d1c37708cd7c447fcb0ea5ce92', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los intentos fallidos en el proceso de login ';

-- Volcando datos para la tabla bienestarcun.logsfails: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `logsfails` DISABLE KEYS */;
INSERT INTO `logsfails` (`Id`, `User`, `Password`, `Fecha`, `Usuario`) VALUES
	(91, 'sadmin', 'dfdf', '2016-09-28 16:43:26', 1104379),
	(92, 'sadminsssss', 'dfdf', '2016-09-28 16:43:37', NULL),
	(93, 'ssd', 'sss', '2016-09-29 17:55:40', NULL),
	(94, 'dd', 'ddd', '2016-09-29 17:59:20', NULL),
	(95, 'sadmin', 'dddsadmin', '2016-09-29 17:59:29', 1104379),
	(96, 'sadmin1', 'sadmin', '2016-10-21 16:31:34', NULL),
	(97, 'sadmin1', 'sadmin', '2016-10-21 16:42:15', NULL),
	(98, 'sadmin', '123', '2016-10-21 16:44:29', 1104379),
	(99, 'sadmin', '123', '2016-10-21 16:44:40', 1104379),
	(100, 'sadmim', 'sadmin', '2016-10-27 15:49:26', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Mensajes creados por el o los administradores del circulo, para los usuarios inscritos al circulo';

-- Volcando datos para la tabla bienestarcun.notificaciones: ~19 rows (aproximadamente)
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
	(14, 'Itinerario de ejempl Nuevo itinerario de ejemplo mus?ca ', '2017-07-06 17:30:00', '111', 1),
	(15, 'Presentacion presentacion grupo musica', '2016-12-25 17:41:51', '111', 4),
	(16, 'Oferta laboral', '2016-09-29 23:05:03', '111', 6),
	(17, 'Oferta laboral, ingenieria de sistemas', '2017-09-29 15:51:58', '111', 6),
	(18, 'Se realizara reúnion mañana de los integrantes', '2017-09-29 15:56:39', '111', 1),
	(19, 'ttt ttttt', '0000-00-00 00:00:00', '111', 1),
	(20, 'ttt ttttt', '0000-00-00 00:00:00', '111', 1),
	(21, 'aaaaaa aaaaaaa', '2016-09-29 21:20:00', '111', 1),
	(22, 'gggggg gggggggg', '2016-09-29 21:30:00', '111', 1),
	(23, 'clases clases guitarra', '2017-10-05 08:58:00', '111', 1),
	(24, 'Clase Clase de mucíca', '2016-11-07 14:34:00', '111', 1),
	(25, 'Clases Reunion del grupó, para ajustar detalles de la presentacion', '2016-10-07 16:19:00', '111', 1),
	(26, 'actividád actividad de bienestar, presentaciones', '2016-10-20 20:30:00', '111', 1),
	(27, 'ctividad3 actividad3', '2016-10-25 20:38:00', '111', 1),
	(28, 'ejemplo ejemplo', '2016-10-26 09:30:00', '111', 1),
	(29, 'ejemplo ejemplo', '2016-10-26 09:30:00', '111', 1),
	(30, 'ejemplo ejemplo', '2016-10-26 09:00:00', '111', 1);
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
	(62, 'cc', 'egresado 2', 'egresado 2', '3243', 'sdsdds@dsds', 'sincelejo', 'M', 25, 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran las relaciones entre los usuario y los circulos a los que pertenecen';

-- Volcando datos para la tabla bienestarcun.usuariocirculo: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariocirculo` DISABLE KEYS */;
INSERT INTO `usuariocirculo` (`id`, `Usuario`, `Circulo`) VALUES
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
	(27, 41, 4),
	(28, 2, 1),
	(39, 1104379, 1),
	(40, 6, 1),
	(41, 62, 6),
	(42, 62, 4),
	(43, 62, 3),
	(44, 6, 6);
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

-- Volcando datos para la tabla bienestarcun.usuarios: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `User`, `Password`, `Tipo`, `Estado`) VALUES
	(2, 'admin', 'admin', '1110', '1'),
	(3, 'circle', 'circle', '1101', '1'),
	(4, 'docente', 'docente', '1100', '1'),
	(5, 'estudiante', 'estudiante', '1011', '1'),
	(6, 'egresado', 'egresado', '1010', '1'),
	(7, 'psicologia', 'psicologia', '1001', '1'),
	(8, '9', '1', '1000', '1'),
	(41, 'docente2', 'docente2', '1101', '1'),
	(62, 'egresado2', 'egresado2', '1010', '1'),
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
