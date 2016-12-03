<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$directorio = "./evidencias/";

	chmod($directorio, 0777); 

	//echo '{ "result": ["msm","'.$_FILES['picture']['name'].'---------"] }';
	//echo '{ "result": ["msm","ajaaaa"] }';
	$user 			= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 			: '';
	$token 			= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 		: '';


	if( ValidateToken( $token, $user ) ){

		$file_name = $_FILES['picture']['name'];
		$ruta = $directorio.$file_name;
		$file_temp_name = $_FILES['picture']['tmp_name'];
		
		if ( is_uploaded_file( $file_temp_name ) && copy($file_temp_name, $ruta.'') ) {

			$itinerario	= isset( $_POST["itinerario"] )			? $_POST["itinerario"] 			: '';

			chmod ($directorio, 0644);

			echo SaveEvidenciaBD( $ruta, $itinerario );

		}else{ echo $GLOBALS['resB2']; }

	}else{ echo $GLOBALS['resB2']; }
	


	function SaveEvidenciaBD( $evidencia, $itinerario ){
		//almacena la informacion de la evidencia en la BD

		if( $evidencia != "" && $itinerario != ""){

			$sql = "INSERT INTO evidencias(Nombre, NombreArchivo, Ruta, Itinerario)
					VALUES('imagenEvidencia', '$evidencia', '/evidencias', '$itinerario')";

			$result = InsertarDatos( $sql, true, $user );

			return $result;

		}else{ return  $GLOBALS['resB2']; }

	}


?>

