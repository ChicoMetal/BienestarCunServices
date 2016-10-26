<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/constant.php');
	require_once($PATH.'core/mesages.php');

	$usuario 	= isset( $_POST["usuario"] )		? $_POST["usuario"] 		: '';
	$token 		= isset( $_POST["token"] )			? $_POST["token"] 			: '';

	if( $usuario != '' && $token != "" && ValidateToken( $token, $usuario ) ){
	
		$sql = "SELECT Id, Tipo FROM usuarios 
				WHERE Tipo = '{$GLOBALS['tipeUser']['psicologia'] }' 
				AND Estado = TRUE LIMIT 1";

		echo BuscarDatos( $sql );

	}else{

		echo $GLOBALS['resB2'];

	}
?>