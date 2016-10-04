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


	if( $remitente != '' &&  $receptor != ''){	

			$sql = " UPDATE chatpsicologia SET Estado = TRUE WHERE Remitente = '$receptor' 
															AND  Destinatario = '$remitente' "; //actualizo los mensajes a leidos

			$result = InsertarDatos( $sql );

			$result = json_encode( $result ); 

			echo ('{"result":  '.$result.'  }' );
			
	

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
?>