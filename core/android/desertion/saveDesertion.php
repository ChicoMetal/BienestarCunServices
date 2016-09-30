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
	$facultad	= isset( $_POST["facultad"] )		? $_POST["facultad"] 		: '';
	$desertor	= isset( $_POST["desertor"] )		? $_POST["desertor"] 		: '';
	$descripcion= isset( $_POST["descripcion"] )	? $_POST["descripcion"] 	: '';
	$horario	= isset( $_POST["horario"] )		? $_POST["horario"] 		: '';

	if( $user != '' && $facultad != '' && $desertor != '' && $descripcion != '' && $horario != ''){

		$sql = "SELECT Identificacion, Nombres, COUNT(*) AS existe  
				FROM personas 
				WHERE Identificacion = '$desertor'";

		$result = BuscarDatos( $sql );

		if( $result[0] == "msm" || $result[0][0]->$result[1][2] == "0" ){//verifico la existencia del usuario

			echo  ('{"result":  '.$GLOBALS['resDA1'].'  }' );

		}elseif( $result[0][0]->$result[1][2] != "0" ){

			$sql = "INSERT INTO desercion(Descripcion, Jornada, Facultad, Desertor, Usuario) 
					VALUES( '$descripcion', '$horario', $facultad, $desertor,  $user )";

			$result = InsertarDatos( $sql );

			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );

		}else{

			echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

		}


	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}


?>