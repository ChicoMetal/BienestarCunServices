<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../PATH.php");				
	}

	require_once($PATH.'core/mesages.php');

	/*
		Capturar faltal errores
	*/
	ini_set('display_errors', false);

	error_reporting(-1);

	register_shutdown_function(function(){ //captura errores fatales
		
		$error = error_get_last();
		
		if(null !== $error) {
			// $error ( [type] , [message] , [file] , [line] )

			$contenido .= "Error desde php #!# ";
			$contenido .= "Error: ".$error['message']."#!#";
			$contenido .= "Tipo: ".$error['type']."#!#";
			$contenido .= "Archivo: ".$error['file']."#!#";
			$contenido .= "linea: ".$error['line']."#!#";
			
			SaveDepuration( $contenido );

			echo  $GLOBALS['resZ'];
			exit(0);
			//print_r($error['message']);//Capturo el Error

		}

	});



	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	
	function generar_token( $user ){ //generar codigo identificador de una sesion

		$token = hash( "ripemd160", $user.Time() );
		
		return $token;
	}


	function SaveDepuration( $contenido ){//guardar si se produjo algun error

		$sql = " INSERT INTO depuracion(Contenido)
					VALUES('$contenido')";

		return InsertarDatos( $sql );
	}

	function ValidateToken( $token, $user ){

		$sql = " SELECT count(*) AS logueado
				FROM logs
				WHERE Usuario = '$user' AND Token = '$token' AND Estado = TRUE ";

		$result = json_decode( BuscarDatos( $sql ) );

		$existe = $result->result;


		if( $existe[0][0]->$existe[1][0] > 0 ){

			return true;

		}else{

			return false;
			
		}

		return false;
	}



?>