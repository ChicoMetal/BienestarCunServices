[1mdiff --git a/core/android/user/login.php b/core/android/user/login.php[m
[1mindex e858fdf..55e387c 100644[m
[1m--- a/core/android/user/login.php[m
[1m+++ b/core/android/user/login.php[m
[36m@@ -39,10 +39,12 @@[m
 				SaveLogFails(false, $user, $pass );//guardo el intento fallido de login[m
 [m
 				echo $GLOBALS['resUA2']; //retorno usuario inexistente[m
[32m+[m				[32mexit(0);[m
 [m
 			}else{[m
 [m
 				echo  $result;[m
[32m+[m				[32mexit(0);[m
 [m
 			}[m
 [m
[36m@@ -53,6 +55,7 @@[m
 			array_push( $result, $token ); //agrego el token al array[m
 [m
 			echo json_encode( $result );[m
[32m+[m			[32mexit(0);[m
 [m
 		}else{[m
 [m
[36m@@ -61,11 +64,13 @@[m
 			SaveLogFails(true, $user, $pass, $result[0][0]->$result[1][0] );//guardo el intento fallido de login con la foranea[m
 [m
 			echo $GLOBALS['resUA4'];[m
[32m+[m			[32mexit(0);[m
 		}[m
 [m
 	}else{[m
 [m
 		echo $GLOBALS['resB2'];[m
[32m+[m		[32mexit(0);[m
 [m
 	}[m
 [m
[1mdiff --git a/core/funtion.php b/core/funtion.php[m
[1mindex b92560b..800d2af 100644[m
[1m--- a/core/funtion.php[m
[1m+++ b/core/funtion.php[m
[36m@@ -29,7 +29,7 @@[m
 			SaveDepuration( $contenido );[m
 [m
 			echo $GLOBALS['resZ'];[m
[31m-			exit();[m
[32m+[m			[32mexit(0);[m
 			//print_r($error['message']);//Capturo el Error[m
 [m
 		}[m
[1mdiff --git a/extras/2016-5-10.sql b/extras/2016-5-10.sql[m
[1mdeleted file mode 100644[m
[1mindex b2167fd..0000000[m
[1m--- a/extras/2016-5-10.sql[m
[1m+++ /dev/null[m
[36m@@ -1,564 +0,0 @@[m
[31m--- --------------------------------------------------------[m
[31m--- Host:                         127.0.0.1[m
[31m--- Versión del servidor:         5.6.26 - Source distribution[m
[31m--- SO del servidor:              Linux[m
[31m--- HeidiSQL Versión:             9.3.0.4984[m
[31m--- --------------------------------------------------------[m
[31m-[m
[31m-/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;[m
[31m-/*!40101 SET NAMES utf8mb4 */;[m
[31m-/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;[m
[31m-/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;[m
[31m-[m
[31m--- Volcando estructura de base de datos para bienestarcun[m
[31m-CREATE DATABASE IF NOT EXISTS `bienestarcun` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;[m
[31m-USE `bienestarcun`;[m
[31m-[m
[31m-[m
[31m--- Volcando estructura para tabla bienestarcun.asistencias[m
[31m-CREATE TABLE IF NOT EXISTS `asistencias` ([m
[31m-  `id` int(11) NOT NULL AUTO_INCREMENT,[m
[31m-  `Presencia` varchar(3) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'ausente, presente, excusado',[m
[31m-  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,[m
[31m-  `Usuario` bigint(15) NOT NULL,[m
[31m-  `Itinerario` int(11) NOT NULL,[m
[31m-  PRIMARY KEY (`id`),[m
[31m-  KEY `FK_Asistencias_usuarios` (`Usuario`),[m
[31m-  KEY `FK_Asistencias_itinerarios` (`Itinerario`),[m
[31m-  CONSTRAINT `FK_Asistencias_itinerarios` FOREIGN KEY (`Itinerario`) REFERENCES `itinerarios` (`id`) ON UPDATE CASCADE,[m
[31m-  CONSTRAINT `FK_Asistencias_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE[m
[31m-) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Aqui se almacenara el listado de las asistencias o inasistencia de los estudiantes a los itinerarios';[m
[31m-[m
[31m--- Volcando datos para la tabla bienestarcun.asistencias: ~2 rows (aproximadamente)[m
[31m-/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;[m
[31m-INSERT INTO `asistencias` (`id`, `Presencia`, `Fecha`, `Usuario`, `Itinerario`) VALUES[m
[31m-	(7, '111', '2015-12-07 15:41:15', 1104379, 10),[m
[31m-	(8, '111', '2015-12-07 15:41:15', 8, 10);[m
[31m-/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;[m
[31m-[m
[31m-[m
[31m--- Volcando estructura para tabla bienestarcun.auditoria[m
[