<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	
	$user 		= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 				: '';
	$token 		= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 			: '';

	if( $user != "" && $token !="" && ValidateToken( $token, $user ) ){

		$sql = " SELECT id, Facultad FROM facultad WHERE Estado = true";
	
		echo BuscarDatos( $sql );


	}else{

		echo $GLOBALS['resB2'];
	}


?>