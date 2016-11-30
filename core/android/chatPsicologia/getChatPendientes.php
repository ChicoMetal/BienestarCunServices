<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/constant.php');
	require_once($PATH.'core/mesages.php');

	$tipuser 	= isset( $_POST["tipuser"] )		? ReplaceCharacter($_POST["tipuser"]) 		: '';
	$user 		= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 			: '';
	$token 		= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"])			: '';

	if( $tipuser != '' && $user !="" && $token !="" && ValidateToken( $token, $user ) ){
	

		//TODO dependiendo del tipo de usuario buscar las notificaciones
		$sql = "SELECT cp.Remitente, cp.Destinatario
				FROM chatpsicologia cp, usuarios u
				WHERE ( cp.Estado = FALSE OR cp.Leido >= DATE_SUB(NOW(), INTERVAL 1 HOUR) ) 
				AND cp.Destinatario IN ( SELECT u.id FROM usuarios WHERE u.tipo = '{$GLOBALS['tipeUser']['psicologia'] }' ) 
				GROUP BY cp.Remitente
				ORDER BY MIN(cp.Estado)";//busco usuarios que enviaron mensajes al psicologo y no esten leidos o que no tengan mas de una hora de haberse leido

		//Adaptar para buscar tambien conversaciones con menos de 1 hora
		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}
?>