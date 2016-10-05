<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$status 		= isset( $_POST["status"] )		? $_POST["status"] 		: '';

	if( $user != '' && $status != '' ){

		$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

		$result = BuscarDatos( $sql );

		if( $result[0] != "msm" ){


			$sql = "UPDATE laboralegresado SET Laborando = '$status' WHERE Id = '$user' ";

			$result = InsertarDatos( $sql );

			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );

			if( $status == false ){//si el estado es no laborando, actualizo las fechas finales que esten null

				$sql = "UPDATE historiallaboral SET FechaFin = DATE( NOW() ) WHERE laboralegresado = '$user'";

				InsertarDatos( $sql );//actualizar fecha de finalizacion historiales anteriores
			}

		}else{

			$sql = "INSERT INTO laboralegresado(Id, Laborando) VALUES('$user', '$status')";

			$result = InsertarDatos( $sql );

			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );

		}


	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
		

?>

