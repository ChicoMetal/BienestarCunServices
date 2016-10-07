<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/constant.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/circles/mesages_circles.php');

	$circle 	= isset( $_POST["circle"] )		? $_POST["circle"] 		: '';

	if( $circle != '' ){

		$sql = "SELECT i.id, i.Actividad, i.Fecha, i.Estado, i.Detalle
				FROM itinerarios i 
				WHERE i.Fecha >= NOW() AND i.Circulo = '$circle'  
					AND i.Estado = '{$GLOBALS['statusItinerario']['pendiente'] }' ";//busco itinerarios de  los circulos que el usuario tenga inscritos
				
		
		$result = BuscarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

?>