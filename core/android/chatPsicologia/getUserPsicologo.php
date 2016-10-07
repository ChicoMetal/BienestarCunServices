<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$usuario 	= isset( $_POST["usuario"] )		? $_POST["usuario"] 		: '';

	if( $usuario != ''){
	
		$sql = "SELECT Id, Tipo FROM usuarios WHERE Tipo = '1001' AND Estado = TRUE LIMIT 1";

		$result = BuscarDatos( $sql );

		$result = json_encode( $result );

		echo ('{"result":  '.$result.'  }' );

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
?>