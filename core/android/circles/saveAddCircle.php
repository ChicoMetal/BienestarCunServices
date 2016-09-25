<?php

	

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$circle	= isset( $_POST["circle"] )		? $_POST["circle"] 		: '';

	if( $user != '' && $circle != ''){

		$sql = "INSERT INTO usuariocirculo(Usuario, Circulo) VALUES( $user, $circle)";

		$result = InsertarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

?>