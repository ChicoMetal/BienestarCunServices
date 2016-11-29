<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 			: '';
	$token 			= isset( $_POST["token"] )		? ReplaceCharacter($_POST["token"]) 		: '';
	$status 		= isset( $_POST["status"] )		? ReplaceCharacter($_POST["status"]) 		: '';

	if( $user != '' && $token != '' && $status != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

		$result = json_decode( BuscarDatos( $sql ) );

		$result = $result->result;

		if( $result[0] != "msm" ){


			$sql = "UPDATE laboralegresado SET Laborando = '$status' WHERE Id = '$user' ";

			echo InsertarDatos( $sql );

			if( $status == false ){//si el estado es no laborando, actualizo las fechas finales que esten null

				$sql = "UPDATE historiallaboral SET FechaFin = DATE( NOW() ) WHERE laboralegresado = '$user'";

				InsertarDatos( $sql );//actualizar fecha de finalizacion historiales anteriores
			}

		}else{

			$sql = "INSERT INTO laboralegresado(Id, Laborando) VALUES('$user', '$status')";

			echo InsertarDatos( $sql );

		}


	}else{

		echo  $GLOBALS['resB2'];

	}
		

?>

