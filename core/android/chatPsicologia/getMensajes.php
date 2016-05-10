<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$remitente 	= isset( $_POST["remitente"] )		? $_POST["remitente"] 		: '';
	$receptor 	= isset( $_POST["receptor"] )		? $_POST["receptor"] 		: '';
	$mensaje 	= isset( $_POST["mensaje"] )		? $_POST["mensaje"] 		: '';

	if( $remitente != '' &&  $receptor != ''){
	

		if( $mensaje != ''){

			$sql = "INSERT INTO chatpsicologia(Mensaje, Remitente, Destinatario)
					VALUES('$mensaje','$remitente', '$receptor')";

			InsertarDatos( $sql ) == $GLOBALS['resA4'];

		}


		$sql = "SELECT cp.Id, cp.Mensaje
				FROM chatpsicologia cp
				WHERE cp.Remitente = '$receptor' AND cp.Estado = FALSE
				ORDER BY cp.Fecha";//busco mensajes enviados sin leer

		
		$result = BuscarDatos( $sql );

		if( is_array( $result) ){//verifico si es un array o un string para encodearlo o no
			
			echo json_encode( $result ); //retorno mensajes sin leer

			$sql = " UPDATE chatpsicologia SET Estado = TRUE WHERE Remitente = '$receptor' "; //actualizo los mensajes a leidos

			InsertarDatos( $sql );

		}else{
			echo $result;
		}

	}else{

		echo $GLOBALS['resB2'];

	}
?>