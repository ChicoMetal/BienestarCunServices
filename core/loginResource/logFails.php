<?php
	

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/loginResource/mesages_user.php');

	
	function SaveLogFails( $lvl, $user, $pass, $idUser = '' ){ //guarda un intento fallido de loguearse
		
		if( $lvl ){

			$sql = "INSERT INTO logsfails( User, Password, Usuario)
					VALUES( '$user', '$pass', '$idUser' ) "; //insertar logfail sin foranea


		} else{


			$sql = "INSERT INTO logsfails( User, Password )
					VALUES( '$user', '$pass' ) "; //insert logfails con foranea de usuario


		}

		return InsertarDatos( $sql ); //


	} 

?>