<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$evidencia	= isset( $_POST["evidencia"] )			? $_POST["evidencia"] 			: '';
	$itinerario	= isset( $_POST["itinerario"] )			? $_POST["itinerario"] 			: '';

	if( $evidencia != "" && $itinerario != ""){

		$sql = "INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)
				VALUES('imagenEvidencia', '$evidencia', '/evidencias', '$itinerario')";

		InsertarDatos( $sql );

	}

?>

