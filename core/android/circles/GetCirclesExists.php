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

		$sql = "SELECT c.Id, c.Nombre, c.Descripcion, CONCAT( p.Nombres, ' ', p.Apellidos) AS Admin 
				FROM circulos c, usuarios u, personas p 
				WHERE c.Admin = u.Id AND u.Id = p.Identificacion AND c.Estado = TRUE AND
				c.Id NOT IN ( SELECT uc.Circulo FROM usuariocirculo uc WHERE uc.Usuario = '$user' )
				AND c.Admin IS NOT NULL";//busco circulos que el usuario no tenga inscritos

		
		$result = BuscarDatos( $sql );


		if( is_array( $result) ){//verifico si es un array o un string para encodearlo o no
			
			$list =  json_encode( $result );
			echo ('{"result":'.$list.'}' );

		}else{
			
			 echo ('{"result":  '.$result.'  }' );

		}

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

		

	

?>