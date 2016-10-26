<?php

	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/user/mesages_user.php');

	$id_user 	= isset( $_POST["id_user"] )	? $_POST["id_user"] 	: '';
	$Token 		= isset( $_POST["Token"] )		? $_POST["Token"] 	: '';


	if( $id_user != '' && $Token != ''){

		$sql = "INSERT INTO logs(Usuario, Token) VALUES('$id_user','$Token')";

		echo InsertarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}


?>