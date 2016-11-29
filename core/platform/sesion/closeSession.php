<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/constant.php');

	$userOdonto		= isset( $_COOKIE['userOdonto'] )	? ReplaceCharacter($_POST["userOdonto"]) 	: '';
	$userid			= isset( $_COOKIE['userid'] )		? ReplaceCharacter($_POST["userid"]) 		: '';
	$tipeUser		= isset( $_COOKIE['tipeUser'] )		? ReplaceCharacter($_POST["tipeUser"]) 		: '';
	$tokenOdonto	= isset( $_COOKIE['tokenOdonto'] )	? ReplaceCharacter($_POST["tokenOdonto"]) 	: '';

	if( 
		$userOdonto != '' &&
		$userid != '' &&
		$tipeUser != '' &&
		$tokenOdonto != ''
	){

		
		$sql = " UPDATE logs SET estado = false where usuario ='".base64_decode( $_COOKIE['userOdonto'] )."' AND token='{$_COOKIE['tokenOdonto']}'";


		$resultado = insertarDatos( $sql );

		if( $resultado == $GLOBALS['resA4'] ){

			$time = time() - (60 * 60 * 5);

			setCookie('userOdonto', '', $time );
			setCookie('userid', '', $time );
			setCookie('tipeUser', '', $time );
			setCookie('tokenOdonto', '', $time );

			echo json_encode( $GLOBALS['resB3'] );// session cerrada
			
			
		}else{
			echo json_encode( $resultado );
		}	
		
	}else{
		echo json_encode( $GLOBALS['resB2'] );// session vencida
	}													


?>
