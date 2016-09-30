<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )			? $_POST["user"] 			: '';
	$nameActiviti 	= isset( $_POST["nameActiviti"] )	? $_POST["nameActiviti"] 	: '';
	$detailActivitie= isset( $_POST["detailActivitie"] )? $_POST["detailActivitie"] : '';
	$date 			= isset( $_POST["date"] )			? $_POST["date"] 			: '';
	$hour 			= isset( $_POST["hour"] )			? $_POST["hour"] 			: '';

	if( $user != '' && $nameActiviti != ''&& $detailActivitie != ''&& $date != ''&& $hour != ''){

		$sql = "SELECT id, Admin FROM circulos WHERE Admin = $user LIMIT 1";

		$result = BuscarDatos( $sql ); //obtengo el circulo al cual esta administrando el docente enviado

		if( $result[0] == "msm" ){

			echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

		}else{

			$circulo = $result[0][0]->$result[1][0];

			$datefinal = $date." ".$hour;

			$sql = "INSERT INTO itinerarios(Actividad, Detalle, Fecha, Circulo)
				VALUES('$nameActiviti', '$detailActivitie', '$datefinal', '$circulo')";

			$result =  InsertarDatos($sql);

			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );

		}

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
		

?>

