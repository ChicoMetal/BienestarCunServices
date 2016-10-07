<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/constant.php');
	require_once($PATH.'core/mesages.php');

	$tipuser 	= isset( $_POST["tipuser"] )		? $_POST["tipuser"] 		: '';

	if( $tipuser != ''){
	

		//TODO dependiendo del tipo de usuario buscar las notificaciones
		$sql = "SELECT cp.Remitente, cp.Destinatario
				FROM chatpsicologia cp, usuarios u
				WHERE cp.Estado = FALSE 
				AND cp.Destinatario IN ( SELECT u.id FROM usuarios WHERE u.tipo = '{$GLOBALS['tipeUser']['psicologia'] }' ) 
				GROUP BY cp.Remitente";//busco circulos que el usuario no tenga inscritos

		
		$result = BuscarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
?>