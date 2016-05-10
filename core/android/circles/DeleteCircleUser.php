<?php

	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$circle	= isset( $_POST["circle"] )		? $_POST["circle"] 		: '';

	if( $user != '' && $circle != ''){

		$sql = "DELETE FROM usuariocirculo WHERE Usuario = $user AND Circulo = $circle LIMIT 1";

		echo InsertarDatos( $sql );

	}else{

		echo $GLOBALS['resB2'];

	}

?>