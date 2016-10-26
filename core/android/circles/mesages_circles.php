<?php
		
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar

	$resIA1 = '{ "result": ["mss", "000"] }';	//Pendiente
	$resIA2 = '{ "result": ["mss", "001"] }';	//Aplazado
	$resIA3 = '{ "result": ["mss", "010"] }';	//Cancelado
?>