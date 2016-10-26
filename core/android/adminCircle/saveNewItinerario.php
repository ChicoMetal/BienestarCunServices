<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )			? $_POST["user"] 			: '';
	$token 			= isset( $_POST["token"] )			? $_POST["token"] 			: '';
	$nameActiviti 	= isset( $_POST["nameActiviti"] )	? $_POST["nameActiviti"] 	: '';
	$detailActivitie= isset( $_POST["detailActivitie"] )? $_POST["detailActivitie"] : '';
	$date 			= isset( $_POST["date"] )			? $_POST["date"] 			: '';
	$hour 			= isset( $_POST["hour"] )			? $_POST["hour"] 			: '';

	if( $user != '' && $token != '' && $nameActiviti != ''&& $detailActivitie != ''&& $date != ''&& $hour != '' 
		&& ValidateToken( $token, $user ) ){

		$sql = "SELECT id, Admin FROM circulos WHERE Admin = $user LIMIT 1";

		$result = json_decode( BuscarDatos( $sql ) ); //obtengo el circulo al cual esta administrando el docente enviado

		$result = $result->result;

		if( $result[0] == "msm" ){

			echo  $GLOBALS['resB2'];

		}else{

			$clave = 0;
			
			$key = $result[1]->$clave;

			$circulo = $result[0][0]->$key;

			$datefinal = $date." ".$hour;

			$sql = "INSERT INTO itinerarios(Actividad, Detalle, Fecha, Circulo)
				VALUES('$nameActiviti', '$detailActivitie', '$datefinal', '$circulo')";

			echo InsertarDatos($sql);

		}

	}else{

		echo  $GLOBALS['resB2'];

	}
		

?>

