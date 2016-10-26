<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$token 	= isset( $_POST["token"] )		? $_POST["token"] 		: '';


	if( $user != '' && $token != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT c.Id, c.Nombre, c.Descripcion, CONCAT( p.Nombres, ' ', p.Apellidos) AS Admin 
				FROM circulos c, usuarios u, personas p 
				WHERE c.Admin = u.Id AND u.Id = p.Identificacion AND c.Estado = TRUE AND
				c.Id NOT IN ( SELECT uc.Circulo FROM usuariocirculo uc WHERE uc.Usuario = '$user' )
				AND c.Admin IS NOT NULL";//busco circulos que el usuario no tenga inscritos

		
		echo BuscarDatos( $sql );

	}else{

		echo  $GLOBALS['resB2'];

	}

		

	

?>