<?php
	//111 Pendiente
	//110 Aplazado
	//000 Cancelado

	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/constant.php');

	$user 			= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 			: '';
	$token 			= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 		: '';
	$itinerario 	= isset( $_POST["idItinerario"] )	? ReplaceCharacter($_POST["idItinerario"]) 	: '';

	if( $user != '' && $token != '' && $itinerario != '' && ValidateToken( $token, $user ) ){

		$sql = "UPDATE itinerarios 
				SET Estado = '{$GLOBALS['statusItinerario']["cancelado"]}' 
				WHERE id = '$itinerario' ";

		echo InsertarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}

?>