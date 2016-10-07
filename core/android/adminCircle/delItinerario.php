<?php
	//111 Pendiente
	//110 Aplazado
	//000 Cancelado

	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/constant.php');

	$itinerario 	= isset( $_POST["idItinerario"] )		? $_POST["idItinerario"] 		: '';

	if( $itinerario != '' ){

		$sql = "UPDATE itinerarios 
				SET Estado = '{$GLOBALS['statusItinerario']["cancelado"]}' 
				WHERE id = '$itinerario' ";

		$result = InsertarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

?>