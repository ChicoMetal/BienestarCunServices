<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$remitente 	= isset( $_POST["remitente"] )		? $_POST["remitente"] 		: '';
	$receptor 	= isset( $_POST["receptor"] )		? $_POST["receptor"] 		: '';
	$token 		= isset( $_POST["token"] )			? $_POST["token"] 			: '';


	if( $remitente != '' &&  $receptor != '' &&  $token != '' && ValidateToken( $token, $remitente ) ){
	
	
		$sql = "SELECT cp.Remitente, cp.Mensaje
				FROM chatpsicologia cp
				WHERE cp.Remitente = '$receptor' AND cp.Destinatario ='$remitente' AND cp.Estado = FALSE OR 
					  cp.Remitente = '$remitente' AND cp.Destinatario ='$receptor' AND cp.Estado = FALSE
				ORDER BY cp.Fecha";//busco mensajes enviados sin leer

		
		echo BuscarDatos( $sql );

	}else{

		echo $GLOBALS['resB2'];

	}
?>