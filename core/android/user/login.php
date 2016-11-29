<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/loginResource/mesages_user.php');


	$user 	= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 		: '';
	$pass 	= isset( $_POST["password"] )	? ReplaceCharacter($_POST["password"]) 	: '';

	if( $user != '' && $pass != ''){


		$sql = "SELECT Id, User, Password, Tipo, Estado FROM usuarios WHERE User='$user' AND estado = TRUE LIMIT 1";

		$result =  BuscarDatos($sql);

		$response = json_decode( $result );

		$response = $response->result;	

		if( is_object( $response[1] ) ){
			$index = 2;
			$key = $response[1]->$index;	
		}

		if ( $response[0] == "msm"  ){//Verifico si la respuesta es un objeto
			
			if( $result == $GLOBALS['resA3'] ){ //Pregunto si no se encontro registros

				include_once( $PATH.'core/loginResource/logFails.php');

				SaveLogFails(false, $user, $pass );//guardo el intento fallido de login

				echo $GLOBALS['resUA2'];//retorno usuario inexistente
				exit(0);

			}else{

				echo $result;
				exit(0);

			}

		}elseif( $response[0][0]->$key === $pass ){//verifico q coincidan los pass

			$index = 0;
			$key = $response[1]->$index;

			$token = generar_token( $response[0][0]->$key );//genero token unico

			array_push( $response, $token ); //agrego el token al array

			$result = json_encode( $response );

			echo ('{"result":  '.$result.'  }' );//se crea el json nuevamente dado que debo editar el array contenido
			exit(0);

		}else{

			include_once( $PATH.'core/loginResource/logFails.php');

			$index = 0;
			$key = $response[1]->$index;

			SaveLogFails(true, $user, $pass, $response[0][0]->$key );//guardo el intento fallido de login con la foranea

			echo  $GLOBALS['resUA4'];
			exit(0);
		}

	}else{

		echo  $GLOBALS['resB2'];
		exit(0);

	}

?>