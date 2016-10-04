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
	
		$sql = "SELECT cp.Remitente, cp.Mensaje
				FROM chatpsicologia cp
				WHERE cp.Remitente = '$receptor' AND cp.Destinatario ='$remitente' AND cp.Estado = FALSE OR 
					  cp.Remitente = '$remitente' AND cp.Destinatario ='$receptor' AND cp.Estado = FALSE
				ORDER BY cp.Fecha";//busco mensajes enviados sin leer

		
		$result = BuscarDatos( $sql );

		if( $result[0] != "msm" ){//verifico si es un array o un string para encodearlo o no
			
			$result = json_encode( $result ); //retorno mensajes sin leer

			echo ('{"result":  '.$result.'  }' );

		}else{
			
			echo ('{"result":  '.$result.'  }' );
			
		}

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
?>