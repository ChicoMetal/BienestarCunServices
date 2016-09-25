<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';

	if( $user != '' ){

		$sql = "SELECT c.id, c.Nombre, c.Descripcion, CONCAT( p.Nombres, ' ', p.Apellidos) AS Admin 
				FROM circulos c, usuarios u, personas p, usuariocirculo uc 
				WHERE c.Admin = u.id AND u.id = p.Identificacion AND uc.Circulo = c.id AND 
				c.Estado = TRUE AND uc.Usuario = '$user' ";//busco circulos que el usuario no tenga inscritos

		
		$result = BuscarDatos( $sql );

		$result = json_encode( $result );

		echo ( '{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

?>