<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/desertion/mesages_desertion.php');

	$user 		= isset( $_POST["user"] )			? $_POST["user"] 			: '';
	$desertor	= isset( $_POST["desertor"] )		? $_POST["desertor"] 		: '';
	$horario	= isset( $_POST["horario"] )		? $_POST["horario"] 		: '';

	if( $user != '' && $desertor != '' && $horario != ''){

		$sql = "SELECT Identificacion, Nombres, COUNT(*) AS existe  FROM personas WHERE Identificacion = '$desertor'";

		$result = BuscarDatos( $sql );

		

		if( is_array( $result ) AND $result[0][0]->$result[1][2] != "0"  ){//verifico la existencia del usuario

			$sql = "INSERT INTO desercion(Jornada, Desertor, Usuario) VALUES( '$horario', $desertor, $user )";

			echo InsertarDatos( $sql );

		}else{

			echo $GLOBALS['resDA1'];

		}


	}else{

		echo $GLOBALS['resB2'];

	}


?>