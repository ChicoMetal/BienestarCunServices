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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el listado de las asistencias o inasistencia de los estudiantes a los itinerarios';

-- Volcando datos para la tabla bienestarcun.asistencias: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` (`id`, `Presencia`, `Fecha`, `Usuario`, `Itinerario`) VALUES
	(49, '000', '2016-12-03 13:54:31', 5, 45),
	(50, '111', '2016-12-03 13:54:31', 1104379, 45),
	(51, '000', '2016-12-03 13:54:31', 6, 45),
	(52, '111', '2016-12-03 13:54:31', 2, 45),
	(53, '000', '2016-12-03 13:54:31', 8, 45);
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.auditoria
CREATE TABLE IF NOT EXISTS `auditoria` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tabla` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Accion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Old` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User` bigint(15) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Auditoria_usuarios` (`User`),
  CONSTRAINT `FK_Auditoria_usuarios` FOREIGN KEY (`User`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran todos los movimientos realizados en la base de datos y el usuario que lo realizo';

-- Volcando datos para la tabla bienestarcun.auditoria: ~31 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`Id`, `Tabla`, `Accion`, `Old`, `Fecha`, `User`) VALUES
	(40, 'laboralegresado', 'UPDATE laboralegresado SET Laborando = \'1\' WHERE Id = \'1104379\' ', NULL, '2016-12-03 00:55:40', 1104379),
	(44, 'itinerarios', 'UPDATE itinerarios \r\n				SET Estado = \'000\' \r\n				WHERE id = \'44\' ', NULL, '2016-12-03 01:07:34', 1104379),
	(47, 'usuariocirculo', 'DELETE FROM usuariocirculo WHERE Usuario = 1104379 AND Circulo = 3 LIMIT 1', NULL, '2016-12-03 01:09:13', 1104379),
	(48, 'usuariocirculo', 'INSERT INTO usuariocirculo(Usuario, Circulo) VALUES( 1104379, 3)', NULL, '2016-12-03 01:10:16', 1104379),
	(50, 'historiallaboral', 'INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, LaboralEgresado)\r\n			 VALUES(\'Aikon\', \'Programador\', \'2014-11-3\', \'1104379\')', NULL, '2016-12-03 01:20:45', 1104379),
	(51, 'logs', ' UPDATE logs SET Estado = FALSE \r\n					WHERE Token = \'3f41656fe88d18c565d19304404283517f61ade4\' AND Estado = TRUE AND Usuario = \'1104379\' ', NULL, '2016-12-03 01:26:47', 1104379),
	(55, 'usuariocirculo', 'DELETE FROM usuariocirculo WHERE Usuario = 1104379 AND Circulo = 3 LIMIT 1', NULL, '2016-12-03 01:31:02', 1104379),
	(56, 'laboralegresado', 'UPDATE laboralegresado SET Laborando = \'0\' WHERE Id = \'1104379\' ', NULL, '2016-12-03 01:31:16', 1104379),
	(57, 'historiallaboral', 'UPDATE historiallaboral SET FechaFin = DATE( NOW() ) WHERE laboralegresado = \'1104379\'', NULL, '2016-12-03 01:31:16', 1104379),
	(58, 'usuariocirculo', 'INSERT INTO usuariocirculo(Usuario, Circulo) VALUES( 1104379, 3)', NULL, '2016-12-03 12:48:02', 1104379),
	(59, 'usuariocirculo', 'DELETE FROM usuariocirculo WHERE Usuario = 1104379 AND Circulo = 3 LIMIT 1', NULL, '2016-12-03 12:48:17', 1104379),
	(60, 'desercion', 'INSERT INTO desercion(Descripcion, Jornada, Facultad, Desertor, Usuario) \r\n					VALUES( \'No asiste\', \'Nocturno\', 1, 1104379,  1104379 )', NULL, '2016-12-03 12:49:01', 1104379),
	(62, 'historiallaboral', 'INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, LaboralEgresado)\r\n			 VALUES(\'Ejemplo\', \'Ejemplo\', \'2015-12-5\', \'1104379\')', NULL, '2016-12-03 12:49:52', 1104379),
	(63, 'laboralegresado', 'UPDATE laboralegresado SET Laborando = \'1\' WHERE Id = \'1104379\' ', NULL, '2016-12-03 12:50:15', 1104379),
	(64, 'itinerarios', 'INSERT INTO itinerarios(Actividad, Detalle, Fecha, Circulo)\r\n				VALUES(\'Actividad\', \'Actividad\', \'2016-12-3 18:0:00\', \'1\')', NULL, '2016-12-03 12:51:07', 1104379),
	(67, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'111\',\'6\',\'45\'),(\'000\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:07:23', 1104379),
	(76, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'111\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'111\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:31:28', 1104379),
	(77, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'111\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'111\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:39:41', 1104379),
	(78, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:43:19', 1104379),
	(79, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:43:56', 1104379),
	(80, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:44:57', 1104379),
	(81, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:51:06', 1104379),
	(82, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:53:00', 1104379),
	(83, 'asistencias', 'INSERT INTO asistencias(Presencia, Usuario, Itinerario) VALUES(\'000\',\'5\',\'45\'),(\'111\',\'1104379\',\'45\'),(\'000\',\'6\',\'45\'),(\'111\',\'2\',\'45\'),(\'000\',\'8\',\'45\')', NULL, '2016-12-03 13:54:31', 1104379),
	(88, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140040.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:00:24', 1104379),
	(89, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140319.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:03:19', 1104379),
	(90, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140400.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:03:47', 1104379),
	(91, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140502.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:04:44', 1104379),
	(92, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140714.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:06:58', 1104379),
	(94, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_140923.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:09:07', 1104379),
	(95, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_141021.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:10:21', 1104379),
	(96, 'evidencias', 'INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)\r\n					VALUES(\'imagenEvidencia\', \'./evidencias/Evidencia#!#45#!#20161203_141055.jpg\', \'/evidencias\', \'45\')', NULL, '2016-12-03 14:10:37', 1104379),
	(97, 'itinerarios', 'UPDATE itinerarios \r\n				SET Estado = \'000\' \r\n				WHERE id = \'45\' ', NULL, '2016-12-03 14:41:56', 1104379);
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.chatpsicologia
CREATE TABLE IF NOT EXISTS `chatpsicologia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Mensaje` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Leido` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estado` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'leido, no leido',
  `Remitente` bigint(15) NOT NULL,
  `Destinatario` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_chatpsicologia_usuarios` (`Remitente`),
  KEY `FK_chatpsicologia_usuarios_2` (`Destinatario`),
  CONSTRAINT `FK_chatpsicologia_usuarios` FOREIGN KEY (`Remitente`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chatpsicologia_usuarios_2` FOREIGN KEY (`Destinatario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los mensajes dirijidos a la psicologa';

-- Volcando datos para la tabla bienestarcun.chatpsicologia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `chatpsicologia` DISABLE KEYS */;
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
	(1, 'Musíca', 'Actividad de canto, guitarra, bajo', 1, 1104379, 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla bienestarcun.depuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `depuracion` DISABLE KEYS */;
INSERT INTO `depuracion` (`Id`, `Contenido`, `Fecha`) VALUES
	(1, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: C:\\xampp\\htdocs\\BienestarCun\\core\\conexion.php#!#linea: 32#!#', '2016-12-05 15:21:55'),
	(2, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: C:\\xampp\\htdocs\\BienestarCun\\core\\platform\\index\\savePerson.php#!#linea: 77#!#', '2016-12-05 15:24:39'),
	(3, 'Error desde php #!# Error: Trying to get property of non-object#!#Tipo: 8#!#Archivo: C:\\xampp\\htdocs\\BienestarCun\\core\\platform\\index\\savePerson.php#!#linea: 77#!#', '2016-12-05 15:25:14'),
	(4, 'Error desde php #!# Error: Undefined index: resz#!#Tipo: 8#!#Archivo: C:\\xampp\\htdocs\\BienestarCun\\core\\platform\\index\\savePerson.php#!#linea: 91#!#', '2016-12-05 15:48:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los registros hechos por los docente por estudiantes en ausencia prolongada con posible desercion';

-- Volcando datos para la tabla bienestarcun.desercion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `desercion` DISABLE KEYS */;
INSERT INTO `desercion` (`id`, `Descripcion`, `Jornada`, `Fecha`, `Estado`, `Facultad`, `Desertor`, `Usuario`) VALUES
	(65, 'no asiste', 'Nocturno', '2016-12-03 00:42:36', 0, 1, 1104379, 1104379),
	(66, 'No asiste', 'Nocturno', '2016-12-03 12:49:01', 0, 1, 1104379, 1104379);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran la informacion de los archivos subidos por los administradores de los circulos, ubicacion, nombre del archivo etc.';

-- Volcando datos para la tabla bienestarcun.evidencias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se va almacenando los historiales laborales de los egresados, empleos que ha tenido, lugar donde labora actualmente etc.';

-- Volcando datos para la tabla bienestarcun.historiallaboral: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historiallaboral` DISABLE KEYS */;
INSERT INTO `historiallaboral` (`Id`, `Empresa`, `Cargo`, `FechaInicio`, `FechaFin`, `LaboralEgresado`) VALUES
	(3, 'Aikon', 'Programador', '2014-11-03', '2016-12-03', 1104379),
	(4, 'Ejemplo', 'Ejemplo', '2015-12-05', NULL, 1104379);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran el itinerario de cada uno de los circulos, como las clases que se llevaran a cabo.';

-- Volcando datos para la tabla bienestarcun.itinerarios: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerarios` DISABLE KEYS */;
INSERT INTO `itinerarios` (`id`, `Actividad`, `Detalle`, `Fecha`, `Ciclo`, `Estado`, `Circulo`) VALUES
	(23, 'Clase', 'Clase de mucíca', '2016-11-07 14:34:00', 0, '111', 1),
	(24, 'Clases', 'Reunion del grupó, para ajustar detalles de la presentacion', '2016-10-07 16:19:00', 0, '111', 1),
	(25, 'actividád', 'actividad de bienestar, presentaciones', '2016-10-20 20:30:00', 0, '111', 1),
	(28, 'ctividad3', 'actividad3', '2016-10-25 20:38:00', 0, '000', 1),
	(31, 'ejemplo', 'ejemplo', '2016-10-26 09:00:00', 0, '000', 1),
	(32, 'Reunion', 'Reunion', '2016-11-23 09:30:00', 0, '111', 1),
	(33, 'Clase /"rh/\'', 'Ghfhvh', '2016-11-23 09:31:00', 0, '111', 1),
	(34, 'Reunion', 'Reunion', '2016-11-23 18:00:00', 0, '111', 1),
	(35, 'clase', 'clase', '2016-11-28 09:00:00', 0, '111', 2),
	(36, 'Clase', 'Closeeeeeee', '2016-11-28 09:16:00', 0, '111', 2),
	(37, 'Clase', 'Closeeeeeee2', '2016-11-28 09:16:00', 0, '111', 2),
	(38, 'Clase', 'Clase', '2016-11-28 09:33:00', 0, '111', 1),
	(39, 'Clase', 'Clase', '2016-11-28 21:05:00', 0, '111', 1),
	(40, 'clase de musica', 'clase de musica 2', '2016-11-29 20:27:00', 0, '111', 1),
	(41, 'Reunion', 'Reunion', '2016-11-29 01:21:00', 0, '111', 1),
	(42, 'Reunion', 'Reunion', '2016-11-29 01:21:00', 0, '111', 1),
	(43, 'Ejemplo', 'Ejemplo', '2016-11-29 23:24:00', 0, '111', 1),
	(44, 'Reunion', 'Reunion', '2016-12-03 15:03:00', 0, '000', 1),
	(45, 'Actividad', 'Actividad', '2016-12-03 18:00:00', 0, '000', 1);
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
	(2, 0, '2016-11-22 22:39:04', '2016-11-27 21:15:23'),
	(1104379, 1, '2016-10-20 23:38:13', '2016-12-03 12:49:51');
/*!40000 ALTER TABLE `laboralegresado` ENABLE KEYS */;

-- Volcando estructura para tabla bienestarcun.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cerrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Usuario` bigint(15) NOT NULL,
  `Token` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Token` (`Token`),
  KEY `FK_Logs_usuarios` (`Usuario`),
  CONSTRAINT `FK_Logs_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacena el historial de logs por los usuarios';

-- Volcando datos para la tabla bienestarcun.logs: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`Id`, `Fecha`, `Cerrada`, `Usuario`, `Token`, `Estado`) VALUES
	(177, '2016-11-27 21:47:10', '2016-12-03 01:25:55', 2, '339c5cf21b657af49be803bba58f875a0538bf6f', 1),
	(181, '2016-11-28 21:24:31', '2016-12-03 01:25:55', 1234567891, 'f81e8be3031c7db6068aad0433a3e67855794593', 1),
	(182, '2016-11-28 21:25:44', '2016-12-03 01:25:55', 7, 'da6b4565362d089dd5b3b1463b2df1d4e5981f22', 1),
	(183, '2016-11-29 00:00:09', '2016-12-03 01:25:55', 7, '2365aed17d15f8965e9b9d6eaeb03fb0712857ca', 1),
	(186, '2016-11-29 16:23:20', '2016-12-03 01:25:55', 1104379, 'a44218771228385072333ddb70281c01c19759b6', 1),
	(188, '2016-11-29 22:01:37', '2016-12-03 01:25:55', 1104379, '4b966d8df83170b653beee60fda630e6f082622b', 1),
	(189, '2016-11-29 22:20:02', '2016-12-03 01:25:55', 7, '7ddf01f7ace8624344c6ba6b73cc3518f3669836', 1),
	(190, '2016-12-02 18:22:46', '2016-12-03 01:25:55', 1104379, '42504e566c9b2f230e2bc869a3c42abaddc05006', 1),
	(191, '2016-12-03 01:05:58', '2016-12-03 01:26:47', 1104379, '3f41656fe88d18c565d19304404283517f61ade4', 0),
	(192, '2016-12-03 01:30:16', '2016-12-03 01:30:35', 2, 'b4e4ede38c7c1f264481c0b164a05aae25be0749', 0),
	(193, '2016-12-03 01:30:53', '2016-12-03 13:58:21', 1104379, '5bba30778b874c29d0ec47118ce08a0ec65617df', 0),
	(194, '2016-12-03 13:58:35', '2016-12-03 13:58:35', 1104379, '7b614001859219c961b41bd83fbd114f20fa7dba', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los intentos fallidos en el proceso de login ';

-- Volcando datos para la tabla bienestarcun.logsfails: ~95 rows (aproximadamente)
/*!40000 ALTER TABLE `logsfails` DISABLE KEYS */;
INSERT INTO `logsfails` (`Id`, `User`, `Password`, `Fecha`, `Usuario`) VALUES
	(190, 'ss', '123', '2016-12-05 16:43:22', NULL),
	(191, 'ss', '123', '2016-12-05 16:44:55', NULL),
	(192, 'ss', '123', '2016-12-05 16:45:06', NULL),
	(193, 'ss', '123', '2016-12-05 16:48:37', NULL),
	(194, 'ss', '123', '2016-12-05 16:49:16', NULL),
	(195, 'ss', '123', '2016-12-05 16:49:21', NULL),
	(196, 'ss', '123', '2016-12-05 16:49:24', NULL),
	(197, 'admin', '123', '2016-12-05 16:49:53', 2),
	(198, 'admin', '123', '2016-12-05 16:50:27', 2),
	(199, 'admin', '123', '2016-12-05 16:50:37', 2),
	(200, 'admin', '123', '2016-12-05 16:50:40', 2),
	(201, 'krlos', 'KRLOS19915991', '2016-12-05 16:52:21', NULL),
	(202, 'admin', 'KRLOS19915991', '2016-12-05 16:52:25', 2),
	(203, 'admin', '123', '2016-12-05 16:52:28', 2),
	(204, 'admin', 'adin', '2016-12-05 17:12:21', 2),
	(205, 'estudiante', 'estudiante', '2016-12-05 17:21:42', NULL),
	(206, 'estudiante', 'estudiante', '2016-12-05 17:21:48', NULL),
	(207, 'estudiante', 'estudiante', '2016-12-05 17:22:02', NULL),
	(208, 'estudiante', 'estudiante', '2016-12-05 17:22:05', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Mensajes creados por el o los administradores del circulo, para los usuarios inscritos al circulo';

-- Volcando datos para la tabla bienestarcun.notificaciones: ~37 rows (aproximadamente)
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
	(14, 'Itinerario de ejempl Nuevo itinerario de ejemplo musíca ', '2017-07-06 17:30:00', '111', 1),
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
	(30, 'ejemplo ejemplo', '2016-10-26 09:00:00', '111', 1),
	(31, 'Reunion Reunion', '2016-11-23 09:30:00', '111', 1),
	(32, 'Clase /"rh/\' Ghfhvh', '2016-11-23 09:31:00', '111', 1),
	(33, 'Reunion Reunion', '2016-11-23 18:00:00', '111', 1),
	(34, 'clase clase', '2016-11-28 09:00:00', '111', 2),
	(35, 'Clase Closeeeeeee', '2016-11-28 09:16:00', '111', 2),
	(36, 'Clase Closeeeeeee2', '2016-11-28 09:16:00', '111', 2),
	(37, 'Clase Clase', '2016-11-28 09:33:00', '111', 1),
	(38, 'Clase Clase', '2016-11-28 21:05:00', '111', 1),
	(39, 'clase de musica clase de musica 2', '2016-11-29 20:27:00', '111', 1),
	(40, 'Reunion Reunion', '2016-11-29 01:21:00', '111', 1),
	(41, 'Reunion Reunion', '2016-11-29 01:21:00', '111', 1),
	(42, 'Ejemplo Ejemplo', '2016-11-29 23:24:00', '111', 1),
	(43, 'Reunion Reunion', '2016-12-03 15:03:00', '111', 1),
	(44, 'Actividad Actividad', '2016-12-03 18:00:00', '111', 1);
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
	(123, 'CC', 'algo', 'algo', '123', 'algo@algo', 'algo', 'M', 12, 1),
	(1234, 'cc', 'pedro', 'perez', '-', '-', '-', 'M', 23, 5),
	(12345, 'CC', 'pedro', 'perez', '28145654', 'ddd@ddd.com', 'sincelejo', 'M', 23, 1),
	(55244, 'CC', 'default', 'default', '-', '-', '-', 'M', 0, 2),
	(1104379, 'CC', 'carlos', 'guzman', '300866', 'ss@dd.com', '20 julio', 'M', 24, 1),
	(1000000000, 'cc', 'default', 'default', '0', '-', '-', 'M', 0, 1),
	(1234567891, 'cc', 'persona', 'persona', '30056', 'ssss@dfd', 'ddsds', 'M', 17, 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran las relaciones entre los usuario y los circulos a los que pertenecen';

-- Volcando datos para la tabla bienestarcun.usuariocirculo: ~25 rows (aproximadamente)
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
	(40, 6, 1),
	(41, 62, 6),
	(42, 62, 4),
	(43, 62, 3),
	(44, 6, 6),
	(50, 1104379, 1),
	(51, 1234567891, 7),
	(52, 1234567891, 4),
	(53, 5, 1),
	(64, 123, 7),
	(65, 123, 4);
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
	(123, 'algo', 'algo', '1011', '0'),
	(1234, 'egresado1', 'egresado', '1010', '1'),
	(1104379, 'sadmin', 'sadmin', '1111', '1'),
	(1000000000, '--', '--', '1000', '1'),
	(1234567891, 'persona', 'persona', '1011', '1'),
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
