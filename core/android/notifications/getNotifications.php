<?php
	//111 Pendiente
	//110 Aplazado
	//000 Cancelado


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '6';

	if( $user != ''){
		
		//TODO dependiendo del tipo de usuario buscar las notificaciones
		$sql = "SELECT n.id, n.Fecha, n.Notificacion, n.Estado, c.Nombre
				FROM notificaciones n, circulos c, usuariocirculo uc, usuarios u
				WHERE n.Circulo = c.id AND uc.Circulo = c.id  AND uc.Usuario = u.Id
					AND n.Fecha >= NOW() AND uc.Usuario = '$user'";//busco circulos que el usuario no tenga inscritos

		
		$result = BuscarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}

?>