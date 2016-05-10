<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$circle 			= isset( $_POST["circle"] )			? $_POST["circle"] 			: '';

	if( $circle != '' ){

		$sql = "SELECT p.Identificacion, CONCAT( p.Nombres,' ', p.Apellidos ) AS name
				FROM personas p, usuarios u, usuariocirculo uc, circulos c
				WHERE p.Identificacion = u.Id AND u.Id = uc.Usuario AND c.Id = $circle";

		$result = BuscarDatos( $sql );

		if( is_array( $result) )
			echo json_encode( $result );
		else
			echo $result;

	}else{

		echo $GLOBALS['resB2'];

	}
		

?>

