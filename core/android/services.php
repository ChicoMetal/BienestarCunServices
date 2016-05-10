<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../PATH.php");				
	}

	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$accion 	= isset( $_REQUEST["accion"] )		? $_REQUEST["accion"] 		: '';
	$nombres 	= isset( $_REQUEST["nombres"] )		? $_REQUEST["nombres"] 		: '';
	$apellidos 	= isset( $_REQUEST["apellidos"] )	? $_REQUEST["apellidos"] 	: '';
	$edad 		= isset( $_REQUEST["edad"] )		? $_REQUEST["edad"] 		: '';
	$modo 		= isset( $_REQUEST["modo"] )		? $_REQUEST["modo"] 		: '';



	if( $accion == 'insert' ){

		$sql = " insert into datos(nombres, apellidos, edad, tipPeticion) 
				 			 values('$nombres', '$apellidos', '$edad', '$modo')";


		echo json_encode( InsertarDatos( $sql ) );
		//echo gettype ( InsertarDatos( $sql ) );
		
	}elseif( $accion == 'search' ) {

		$sql = " SELECT Identificacion, Tipoid, Nombres, Apellidos, Sexo, Edad FROM personas";
		

		echo json_encode( BuscarDatos( $sql ) );
		
	}else{

		echo $GLOBALS['resB4'];

	}

?>