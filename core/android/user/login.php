<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');
	require_once($PATH.'core/android/user/mesages_user.php');


	$user 	= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$pass 	= isset( $_POST["password"] )	? $_POST["password"] 	: '';

	if( $user != '' && $pass != ''){


		$sql = "SELECT Id, User, Password, Tipo, Estado FROM usuarios WHERE User='$user' AND estado = TRUE LIMIT 1";

		$result = BuscarDatos($sql);

		if ( $result[0] == "msm"  ){//Verifico si la respuesta es un objeto
			
			if( $result == json_decode( $GLOBALS['resA3'] ) ){ //Pregunto si no se encontro registros

				include_once( $PATH.'core/android/user/logFails.php');

				SaveLogFails(false, $user, $pass );//guardo el intento fallido de login

				echo  ('{"result":  '.$GLOBALS['resUA2'].'  }' );//retorno usuario inexistente
				exit(0);

			}else{

				$result = json_encode( $result );

				echo ('{"result":  '.$result.'  }' );
				exit(0);

			}

		}elseif( $result[0][0]->$result[1][2] === $pass ){//verifico q coincidan los pass

			$token = generar_token( $result[0][0]->$result[1][0] );//genero token unico

			array_push( $result, $token ); //agrego el token al array

			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );
			exit(0);

		}else{

			include_once( $PATH.'core/android/user/logFails.php');

			SaveLogFails(true, $user, $pass, $result[0][0]->$result[1][0] );//guardo el intento fallido de login con la foranea

			echo  ('{"result":  '.$GLOBALS['resUA4'].'  }' );
			exit(0);
		}

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );
		exit(0);

	}

?>