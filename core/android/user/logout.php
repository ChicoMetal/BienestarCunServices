<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/android/user/mesages_user.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$token 	= isset( $_POST["token"] )		? $_POST["token"] 		: '';

	if( $user != '' && $token != '' ){


		$sql = " UPDATE logs SET Estado = FALSE 
					WHERE Token = '$token' AND Estado = TRUE AND Usuario = '$user' ";

		InsertarDatos( $sql );

		echo  $GLOBALS['resUA5'];

		
	}else{


		echo $GLOBALS['resB2'];

	
	}


?>