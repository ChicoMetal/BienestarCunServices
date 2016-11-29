<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 		: '';
	$token 	= isset( $_POST["token"] )		? ReplaceCharacter($_POST["token"]) 	: '';

	if( $user != '' && $token != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT c.id, c.Nombre, c.Descripcion, CONCAT( p.Nombres, ' ', p.Apellidos) AS Admin 
				FROM circulos c, usuarios u, personas p, usuariocirculo uc 
				WHERE c.Admin = u.id AND u.id = p.Identificacion AND uc.Circulo = c.id AND 
				c.Estado = TRUE AND uc.Usuario = '$user' ";//busco circulos que el usuario no tenga inscritos

		
		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}

?>