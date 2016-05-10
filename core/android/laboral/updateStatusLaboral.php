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

		if( is_array( $result ) ){


			$sql = "UPDATE laboralegresado SET Laborando = '$status'";

			echo InsertarDatos( $sql );
			

		}else{

			$sql = "INSERT INTO laboralegresado(Id, Laborando) VALUES('$user', '$status')";

			$result = InsertarDatos( $sql );

			echo $result;

		}


	}else{

		echo $GLOBALS['resB2'];

	}
		

?>

