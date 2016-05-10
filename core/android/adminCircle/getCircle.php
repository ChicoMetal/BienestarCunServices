<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )			? $_POST["user"] 			: '';

	if( $user != '' ){

		$sql = "SELECT Id, Admin
				FROM circulos
				WHERE Admin = $user LIMIT 1";

		$result = BuscarDatos( $sql );

		if( is_array( $result) )
			echo json_encode( $result );
		else
			echo $result;

	}else{

		echo $GLOBALS['resB2'];

	}
		

?>

