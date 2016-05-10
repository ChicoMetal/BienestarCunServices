<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/circles/mesages_circles.php');

	$circle 	= isset( $_POST["circle"] )		? $_POST["circle"] 		: '';

	if( $circle != '' ){

		$sql = "SELECT i.id, i.Actividad, i.Fecha, i.Estado, i.Detalle
				FROM itinerarios i 
				WHERE i.Fecha >= NOW() AND i.Circulo = '$circle' ";//busco itinerarios de  los circulos que el usuario tenga inscritos
				
		
		$result = BuscarDatos( $sql );

		if( is_array( $result) ){//verifico si es un array o un string para encodearlo o no
			echo json_encode( $result );
		}else{
			echo $result;
		}

	}else{

		echo $GLOBALS['resB2'];

	}

?>