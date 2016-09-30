<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	

	$sql = " SELECT id, Facultad FROM facultad WHERE Estado = true";

	$result = BuscarDatos( $sql );

	$result = json_encode( $result );

	echo ('{"result":  '.$result.'  }' );	



?>