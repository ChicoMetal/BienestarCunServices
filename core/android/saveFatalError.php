<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/loginResource/mesages_user.php');


	$contenido 	= isset( $_POST["contenido"] )		? ReplaceCharacter( $_POST["contenido"] ) 		: '';

	if ( $contenido != '' ){

		$result = SaveDepuration( $contenido );

		echo $result;

	}

?>