<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '1104379214';

	if( $user != '' ){

		$sql = "SELECT c.id, c.Nombre, c.Descripcion, CONCAT( p.Nombres, ' ', p.Apellidos) AS Admin 
				FROM circulos c, usuarios u, personas p, usuariocirculo uc 
				WHERE c.Admin = u.id AND u.id = p.Identificacion AND uc.Circulo = c.id AND 
				c.Estado = TRUE AND uc.Usuario = '$user' ";//busco circulos que el usuario no tenga inscritos

		
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