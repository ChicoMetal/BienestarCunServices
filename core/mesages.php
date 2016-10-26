<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar

	$resA1 = '{ "result": ["msm","0000"] }'; /* error al conectar  */
	$resA2 = '{ "result": ["msm","0001"] }'; /* error al ejecutar el query */
	$resA3 = '{ "result": ["msm","0010"] }'; /* No existen datos*/
	$resA4 = '{ "result": ["msm","1000"] }'; /* Query ejecutado correctamente */
	$resA5 = '{ "result": ["msm","0100"] }'; /* error al seleccionar la tabla*/
	$resB2 = '{ "result": ["msm","0011"] }'; /* Error en la instruccion*/
	$resB3 = '{ "result": ["msm","1100"] }'; /* Instruccion ejecutada correctamente*/
	$resB4 = '{ "result": ["msm","1101"] }'; /* Peticion indeterminada */

	$resZ = '{ "result": ["msm","000000000"]  }'; /* Error en el server */
?>
