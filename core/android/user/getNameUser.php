<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/user/mesages_user.php');


	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';

	if( $user != '' ){

		$sql = "SELECT Nombres, Apellidos FROM personas WHERE Identificacion = '$user'";

		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}