<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$remitente 	= isset( $_POST["remitente"] )		? ReplaceCharacter($_POST["remitente"]) 	: '';
	$token 		= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 		: '';
	$receptor 	= isset( $_POST["receptor"] )		? ReplaceCharacter($_POST["receptor"]) 		: '';


	if( $remitente != '' &&  $receptor != '' && $token != "" && ValidateToken( $token, $remitente ) ){	

			$sql = " UPDATE chatpsicologia SET Estado = TRUE WHERE Remitente = '$receptor' 
															AND  Destinatario = '$remitente' "; //actualizo los mensajes a leidos

			echo InsertarDatos( $sql );
			

	}else{

		echo $GLOBALS['resB2'];

	}
?>