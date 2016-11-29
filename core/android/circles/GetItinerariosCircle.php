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

	$user 	= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 			: '';
	$token 	= isset( $_POST["token"] )		? ReplaceCharacter($_POST["token"]) 		: '';
	$circle = isset( $_POST["circle"] )		? ReplaceCharacter($_POST["circle"]) 		: '';

	if( $user != '' && $token != '' && $circle != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT i.id, i.Actividad, i.Fecha, i.Estado, i.Detalle
				FROM itinerarios i 
				WHERE i.Fecha >= NOW() AND i.Circulo = '$circle'  
					AND i.Estado = '{$GLOBALS['statusItinerario']['pendiente'] }' ";//busco itinerarios de  los circulos que el usuario tenga inscritos
				
		
		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}

?>