<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$remitente 	= isset( $_POST["remitente"] )		? ReplaceCharacter($_POST["remitente"]) 		: '';
	$receptor 	= isset( $_POST["receptor"] )		? ReplaceCharacter($_POST["receptor"]) 			: '';
	$token 		= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 			: '';


	if( $remitente != '' &&  $receptor != '' &&  $token != '' && ValidateToken( $token, $remitente ) ){
	
	
		$sql = "SELECT cp.Remitente, cp.Mensaje
				FROM chatpsicologia cp
				WHERE cp.Remitente = '$receptor' AND cp.Destinatario ='$remitente' OR 
					  cp.Remitente = '$remitente' AND cp.Destinatario ='$receptor'
				ORDER BY cp.Fecha
				LIMIT 100";//busco mensajes enviados

		
		echo BuscarDatos( $sql );

	}else{

		echo $GLOBALS['resB2'];

	}
?>