<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$tip_identificacion = isset( $_POST["tip_identificacion"] )	
									? ReplaceCharacter( $_POST["tip_identificacion"]) 	: '';

	$Identificacion 	= isset( $_POST["Identificacion"] )		
									? ReplaceCharacter( $_POST["Identificacion"]) 		: '';

	$first_name			= isset( $_POST["first_name"] )			
									? ReplaceCharacter( $_POST["first_name"]) 			: '';

	$Apellidos			= isset( $_POST["Apellidos"] )			
									? ReplaceCharacter( $_POST["Apellidos"]) 			: '';

	$Contacto			= isset( $_POST["Contacto"] )			
									? ReplaceCharacter( $_POST["Contacto"]) 			: '';

	$Email				= isset( $_POST["Email"] )				
									? ReplaceCharacter( $_POST["Email"]) 				: '';

	$Direccion			= isset( $_POST["Direccion"] )			
									? ReplaceCharacter( $_POST["Direccion"]) 			: '';

	$sexo				= isset( $_POST["sexo"] )				
									? ReplaceCharacter( $_POST["sexo"]) 				: '';

	$Edad				= isset( $_POST["Edad"] )				
									? ReplaceCharacter( $_POST["Edad"]) 				: '';

	$sedes				= isset( $_POST["sedes"] )				
									? ReplaceCharacter( $_POST["sedes"]) 				: '';

	$User				= isset( $_POST["User"] )				
									? ReplaceCharacter( $_POST["User"]) 				: '';
	
	$tip_usuario		= isset( $_POST["tip_usuario"] )				
									? ReplaceCharacter( $_POST["tip_usuario"]) 			: '';

	$password			= isset( $_POST["password"] )			
									? ReplaceCharacter( $_POST["password"]) 			: '';


	if(
		$tip_identificacion  != "" &&
		$Identificacion  != "" &&
		$first_name  != "" &&
		$Apellidos  != "" &&
		$Contacto  != "" &&
		$Email  != "" &&
		$Direccion  != "" &&
		$sexo  != "" &&
		$Edad  != "" &&
		$sedes  != "" &&
		$User  != "" &&
		$tip_usuario  != "" &&
		$password  != ""
	 ){

		$sql = "INSERT INTO personas 
					VALUES('$Identificacion','$tip_identificacion','$first_name','$Apellidos',
							'$Contacto','$Email','$Direccion','$sexo','$Edad','$sedes')";

		$result = InsertarDatos( $sql );

		if( $result == $GLOBALS['resA4'] ){

			$sql = "INSERT INTO usuarios 
			VALUES('$Identificacion','$User','$password','$tip_usuario', '0')";

			echo InsertarDatos( $sql );

		}else{

			$sql ="DELETE FROM personas WHERE Identificacion = '$Identificacion'";

			InsertarDatos( $sql );

			echo $GLOBALS['resA2'];

		}
		
	}else{

		echo $GLOBALS['resB2'];

	}


?>