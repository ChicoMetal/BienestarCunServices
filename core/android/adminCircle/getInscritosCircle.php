<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 				= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 			: '';
	$token 				= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 		: '';
	$circle 			= isset( $_POST["circle"] )			? ReplaceCharacter($_POST["circle"]) 		: '';

	if( $user !="" && $token !="" && $circle != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT p.Identificacion, CONCAT( p.Nombres,' ', p.Apellidos ) AS name
				FROM personas p, usuarios u, usuariocirculo uc, circulos c
				WHERE p.Identificacion = u.Id AND u.Id = uc.Usuario AND uc.Circulo = c.Id AND c.Id = $circle";

		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}
		

?>

