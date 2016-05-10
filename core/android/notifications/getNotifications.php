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

	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';

	if( $user != ''){
		
		//TODO dependiendo del tipo de usuario buscar las notificaciones
		$sql = "SELECT n.id, n.Fecha, n.Notificacion, n.Estado, c.Nombre
				FROM notificaciones n, circulos c, usuariocirculo uc, usuarios u
				WHERE n.Circulo = c.id AND uc.Circulo = c.id  AND uc.Usuario = u.Id
					AND n.Fecha >= NOW() AND uc.Usuario = '$user'";//busco circulos que el usuario no tenga inscritos

		
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