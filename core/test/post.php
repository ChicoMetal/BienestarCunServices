<?php 

	/*$remi 	= isset( $_POST["remitente"] )		? $_POST["remitente"] 		: '';
	$des 	= isset( $_POST["destinatario"] )		? $_POST["destinatario"] 		: '';

	echo ("Se han enviado: ".$remi. " y ".$des);*/

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user = ReplaceCharacter('admin');
	$pass = ReplaceCharacter(" admin1' OR '1' = '1' '");

	$sql = "SELECT count(*) FROM usuarios WHERE User='{$user}' AND Password = '".$pass."'";


	$result = BuscarDatos( $sql );
	//$result = BuscarDatos( $sql );

	echo $result;

 ?>