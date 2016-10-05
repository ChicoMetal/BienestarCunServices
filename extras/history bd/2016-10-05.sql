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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el listado de las asistencias o inasistencia de los estudiantes a los itinerarios';

-- Volcando datos para la tabla bienestarcun.asistencias: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=768 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla bienestarcun.depuracion: ~695 rows (aproximadamente)
/*!40000 ALTER TABLE `depuracion` DISABLE KEYS */;
INSERT INTO `depuracion` (`Id`, `Contenido`, `Fecha`) VALUES
	(8, 'Error desde php #!# Error: Undefined variable: user#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidlaboralsaveNewLaboralHistory.php#!#linea: 90#!#', '2016-10-04 19:19:45'),
	(9, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:24:16'),
	(10, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(11, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(12, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(13, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(14, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(15, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(16, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(17, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(18, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(19, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(20, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(21, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(22, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(23, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(24, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(25, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(26, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(27, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(28, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(29, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(30, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(31, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(32, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(33, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(34, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(35, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(36, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(37, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(38, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(39, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(40, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(41, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(42, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(43, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(44, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(45, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(46, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(47, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(48, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(49, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(50, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:07'),
	(51, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(52, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(53, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(54, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(55, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(56, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(57, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(58, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(59, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(60, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(61, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(62, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(63, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(64, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(65, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(66, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(67, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(68, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(69, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(70, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(71, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(72, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(73, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(74, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(75, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(76, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(77, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(78, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(79, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(80, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(81, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(82, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(83, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(84, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(85, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(86, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(87, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(88, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(89, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(90, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(91, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(92, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(93, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(94, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(95, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(96, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(97, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(98, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(99, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(100, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(101, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(102, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(103, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(104, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(105, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:08'),
	(106, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:09'),
	(107, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:09'),
	(108, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:09'),
	(109, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:09'),
	(110, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(111, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(112, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(113, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(114, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(115, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(116, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(117, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(118, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(119, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(120, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(121, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(122, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(123, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(124, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(125, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(126, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(127, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(128, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(129, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(130, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(131, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(132, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(133, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(134, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:14'),
	(135, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(136, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(137, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(138, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(139, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(140, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(141, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(142, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(143, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(144, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(145, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(146, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(147, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(148, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(149, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(150, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(151, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(152, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(153, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(154, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(155, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(156, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(157, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(158, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(159, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(160, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(161, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(162, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(163, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(164, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(165, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(166, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(167, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(168, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(169, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(170, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(171, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(172, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(173, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(174, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(175, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(176, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(177, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(178, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(179, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(180, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(181, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(182, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(183, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(184, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(185, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(186, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(187, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:15'),
	(188, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(189, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(190, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(191, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(192, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(193, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(194, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(195, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(196, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(197, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(198, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(199, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(200, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(201, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(202, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(203, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(204, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(205, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(206, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(207, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(208, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(209, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:16'),
	(210, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(211, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(212, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(213, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(214, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(215, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(216, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(217, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(218, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(219, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(220, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(221, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(222, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(223, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(224, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(225, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(226, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(227, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(228, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(229, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(230, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(231, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(232, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(233, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(234, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(235, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(236, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(237, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(238, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(239, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(240, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(241, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(242, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(243, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(244, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(245, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(246, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(247, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(248, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(249, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(250, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(251, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(252, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(253, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(254, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(255, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(256, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(257, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(258, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(259, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(260, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(261, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(262, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(263, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(264, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(265, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(266, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(267, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(268, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:19'),
	(269, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(270, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(271, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(272, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(273, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(274, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(275, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(276, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(277, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(278, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(279, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(280, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(281, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(282, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(283, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(284, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(285, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(286, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(287, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(288, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(289, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(290, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(291, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(292, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(293, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(294, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(295, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(296, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(297, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(298, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(299, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(300, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(301, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(302, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(303, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(304, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(305, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(306, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(307, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(308, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(309, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(310, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(311, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(312, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(313, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(314, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(315, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(316, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(317, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(318, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(319, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:20'),
	(320, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(321, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(322, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(323, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(324, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(325, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(326, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(327, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(328, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(329, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(330, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(331, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(332, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(333, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(334, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(335, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(336, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(337, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(338, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(339, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(340, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(341, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(342, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(343, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:21'),
	(344, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(345, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(346, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(347, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(348, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(349, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(350, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(351, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(352, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(353, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(354, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(355, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(356, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(357, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(358, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(359, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(360, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(361, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(362, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(363, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(364, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(365, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(366, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(367, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(368, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(369, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(370, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(371, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(372, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(373, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(374, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(375, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(376, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(377, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(378, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(379, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(380, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(381, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(382, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(383, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(384, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(385, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(386, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(387, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(388, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(389, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(390, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(391, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(392, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(393, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(394, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(395, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(396, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(397, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(398, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:25'),
	(399, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(400, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(401, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(402, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(403, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(404, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(405, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(406, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(407, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(408, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(409, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(410, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(411, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(412, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(413, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(414, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(415, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(416, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(417, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(418, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(419, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(420, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(421, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(422, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(423, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(424, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(425, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(426, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(427, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:26'),
	(428, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(429, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(430, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(431, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(432, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(433, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(434, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(435, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(436, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(437, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(438, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(439, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(440, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(441, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(442, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(443, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:27'),
	(444, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(445, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(446, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(447, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(448, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(449, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(450, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(451, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(452, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(453, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(454, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(455, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(456, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(457, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(458, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(459, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(460, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(461, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(462, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(463, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(464, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(465, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(466, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(467, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(468, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(469, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(470, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(471, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(472, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(473, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:29'),
	(474, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(475, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(476, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(477, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(478, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(479, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(480, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(481, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(482, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(483, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(484, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(485, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(486, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(487, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(488, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(489, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(490, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(491, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(492, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:30'),
	(493, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(494, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(495, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(496, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(497, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(498, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(499, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(500, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(501, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(502, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(503, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(504, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(505, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(506, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(507, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(508, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(509, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(510, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(511, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(512, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(513, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(514, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:31'),
	(515, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(516, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(517, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(518, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(519, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(520, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(521, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(522, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(523, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(524, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(525, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(526, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(527, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(528, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(529, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(530, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(531, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(532, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(533, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(534, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(535, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(536, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(537, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(538, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(539, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(540, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:32'),
	(541, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(542, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(543, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(544, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(545, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(546, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(547, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(548, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(549, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(550, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(551, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(552, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(553, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(554, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(555, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(556, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(557, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(558, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(559, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(560, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(561, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(562, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(563, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:33'),
	(564, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(565, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(566, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(567, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(568, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(569, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(570, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(571, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(572, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(573, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(574, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(575, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(576, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(577, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:34'),
	(578, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(579, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(580, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(581, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(582, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(583, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(584, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(585, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(586, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(587, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(588, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(589, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(590, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(591, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(592, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(593, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(594, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(595, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(596, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(597, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(598, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(599, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(600, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(601, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(602, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:35'),
	(603, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(604, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(605, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(606, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(607, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(608, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(609, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(610, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(611, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(612, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(613, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(614, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(615, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(616, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(617, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(618, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(619, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(620, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(621, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(622, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:36'),
	(623, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(624, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(625, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(626, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(627, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(628, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(629, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(630, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(631, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(632, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(633, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(634, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(635, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(636, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(637, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(638, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(639, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(640, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(641, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(642, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(643, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(644, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(645, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:37'),
	(646, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(647, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(648, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(649, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(650, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(651, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(652, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(653, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(654, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(655, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(656, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(657, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(658, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(659, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(660, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(661, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(662, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(663, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(664, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:38'),
	(665, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(666, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(667, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(668, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(669, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(670, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(671, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(672, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(673, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(674, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(675, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(676, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(677, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(678, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(679, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(680, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(681, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(682, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:39'),
	(683, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(684, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(685, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(686, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(687, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(688, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(689, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(690, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(691, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(692, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(693, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(694, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(695, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(696, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(697, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(698, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(699, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(700, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(701, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(702, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:40'),
	(703, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(704, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(705, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(706, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(707, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(708, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(709, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(710, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(711, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(712, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(713, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(714, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(715, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:41'),
	(716, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(717, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(718, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(719, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(720, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(721, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(722, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(723, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(724, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(725, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(726, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(727, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(728, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(729, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(730, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(731, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(732, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(733, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(734, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(735, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:42'),
	(736, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(737, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(738, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(739, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(740, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(741, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(742, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(743, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(744, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(745, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(746, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(747, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:43'),
	(748, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(749, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(750, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(751, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(752, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(753, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(754, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(755, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(756, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(757, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(758, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(759, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(760, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(761, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(762, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(763, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:44'),
	(764, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:45'),
	(765, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:45'),
	(766, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidsaveFatalError.php#!#linea: 20#!#', '2016-10-04 20:43:46'),
	(767, 'Error desde php #!# Error: Array to string conversion#!#Tipo: 8#!#Archivo: C:xampphtdocsBienestarCuncoreandroidchatPsicologiagetMensajes.php#!#linea: 36#!#', '2016-10-04 20:46:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los registros hechos por los docente por estudiantes en ausencia prolongada con posible desercion';

-- Volcando datos para la tabla bienestarcun.desercion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `desercion` DISABLE KEYS */;
INSERT INTO `desercion` (`id`, `Descripcion`, `Jornada`, `Fecha`, `Estado`, `Facultad`, `Desertor`, `Usuario`) VALUES
	(19, 'yyyyyyyy', 'Nocturno', '2016-09-30 00:57:06', 0, 1, 5, 1104379),
	(20, 'no se ha presentado a clases en 4 dias', 'Nocturno', '2016-09-30 01:02:56', 0, 1, 5, 1104379);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran la informacion de los archivos subidos por los administradores de los circulos, ubicacion, nombre del archivo etc.';

-- Volcando datos para la tabla bienestarcun.evidencias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
INSERT INTO `evidencias` (`Id`, `Nombre`, `NombreArchivo`, `Ruta`, `Itinerario`) VALUES
	(1, 'imagenEvidencia', '/Evidencia#!#14#!#20160830_171147.jpg', '/evidencias', 14);
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se va almacenando los historiales laborales de los egresados, empleos que ha tenido, lugar donde labora actualmente etc.';

-- Volcando datos para la tabla bienestarcun.historiallaboral: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `historiallaboral` DISABLE KEYS */;
INSERT INTO `historiallaboral` (`Id`, `Empresa`, `Cargo`, `FechaInicio`, `FechaFin`, `LaboralEgresado`) VALUES
	(42, 'lavid', 'desarrollador', '2014-06-05', '2015-10-05', 1104379),
	(43, 'aikon', 'desarrollador', '2015-08-05', NULL, 1104379);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran el itinerario de cada uno de los circulos, como las clases que se llevaran a cabo.';

-- Volcando datos para la tabla bienestarcun.itinerarios: ~18 rows (aproximadamente)
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
	(14, 'Itinerario de ejempl', 'Nuevo itinerario de ejemplo mus?ca ', '2017-07-06 17:30:00', 0, '111', 1),
	(15, 'Presentacion', 'presentacion grupo musica', '2016-12-25 17:41:51', 1, '111', 4),
	(18, 'ttt', 'ttttt', '0000-00-00 00:00:00', 0, '111', 1),
	(19, 'ttt', 'ttttt', '0000-00-00 00:00:00', 0, '111', 1),
	(20, 'aaaaaa', 'aaaaaaa', '2016-09-29 21:20:00', 0, '111', 1),
	(21, 'gggggg', 'gggggggg', '2016-09-29 21:30:00', 0, '111', 1),
	(22, 'clases', 'clases guitarra', '2017-10-05 08:58:00', 0, '111', 1);
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
	(1104379, 1, '2016-10-04 19:24:56', '2016-10-04 19:27:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacena el historial de logs por los usuarios';

-- Volcando datos para la tabla bienestarcun.logs: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`Id`, `Fecha`, `Usuario`, `Token`, `Estado`) VALUES
	(126, '2016-09-28 15:47:43', 1104379, '350d96b9837462d74616ec6d2f0a9ca6ba31417e', 0),
	(127, '2016-09-28 15:48:24', 1104379, '4daadc3c49013ab025e6fa52aa44d2dc478ba41e', 0),
	(128, '2016-09-28 15:56:42', 1104379, '0df8e196264ccd3e8aedd5196195581b61bd2c18', 0),
	(129, '2016-09-28 16:42:37', 1104379, 'fec00dd6c7e4e32fd20abf6f19e74fb86e4eb472', 0),
	(130, '2016-09-28 16:43:47', 1104379, '7da2105d2d54216455e3db8df7e9b20cc64beca8', 0),
	(131, '2016-09-28 17:05:44', 6, '45af914d9a29e6ffbe191b70948ab74ba04ccc5e', 0),
	(132, '2016-09-28 17:38:13', 62, '2f3018762cd0697a8cce2fc5965fcae605c8657f', 0),
	(133, '2016-09-28 17:47:42', 6, '4924c8a49ac83d963723d80ffa4a18cb4419b97b', 1),
	(134, '2016-09-29 15:50:05', 1104379, '6e18167779f1d52bb64a6b115d19d2a2d16a4325', 0),
	(135, '2016-09-29 16:33:44', 5, 'dc6994ad3db6835a9f93f90fbd5d8efca25bcc62', 0),
	(136, '2016-09-29 16:37:10', 2, '883f9ce42da2b227533d815a17b72460705c408f', 0),
	(137, '2016-09-29 17:20:02', 1104379, 'a3e3a61620335d7c43d639d16c089bfbc9682970', 0),
	(138, '2016-09-29 17:59:36', 1104379, 'a8754a36233c5be43939c504ef6ceba232e45e1a', 1),
	(139, '2016-10-03 14:37:23', 7, 'c5a068f44f1ebe25d982736c6464355c981654b1', 1),
	(140, '2016-10-04 20:30:49', 1104379, 'db49e48eeab1bfebfabe7dfdc9f48d5d6f4a3b74', 0),
	(141, '2016-10-04 20:59:22', 1104379, 'c1b179f07c0ae7b12f659298e75089be216df77b', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenaran los intentos fallidos en el proceso de login ';

-- Volcando datos para la tabla bienestarcun.logsfails: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `logsfails` DISABLE KEYS */;
INSERT INTO `logsfails` (`Id`, `User`, `Password`, `Fecha`, `Usuario`) VALUES
	(91, 'sadmin', 'dfdf', '2016-09-28 16:43:26', 1104379),
	(92, 'sadminsssss', 'dfdf', '2016-09-28 16:43:37', NULL),
	(93, 'ssd', 'sss', '2016-09-29 17:55:40', NULL),
	(94, 'dd', 'ddd', '2016-09-29 17:59:20', NULL),
	(95, 'sadmin', 'dddsadmin', '2016-09-29 17:59:29', 1104379);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Mensajes creados por el o los administradores del circulo, para los usuarios inscritos al circulo';

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
	(23, 'clases clases guitarra', '2017-10-05 08:58:00', '111', 1);
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

-- Volcando datos para la tabla bienestarcun.usuariocirculo: ~20 rows (aproximadamente)
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
