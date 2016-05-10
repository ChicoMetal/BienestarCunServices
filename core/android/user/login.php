<?php

	//1111 = Super Administrador
	//1110 = Administrador
	//1101 = Administrador de circulo
	//1100 = Docente CUN
	//1011 = Estudiante
	//1010 = Estudiante egresado
	//1001 = Psicologa
	//1000 = Usuario sin loguear

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

		if ( !is_array( $result)  ){//Verifico si la respuesta es un objeto

			if( $result == $GLOBALS['resA3'] ){ //Pregunto si no se encontro registros

				include_once( $PATH.'core/android/user/logFails.php');

				SaveLogFails(false, $user, $pass );//guardo el intento fallido de login

				echo $GLOBALS['resUA2']; //retorno usuario inexistente

			}else{

				echo  $result;

			}

		}elseif( $result[0][0]->$result[1][2] === $pass ){//verifico q coincidan los pass

			$token = generar_token( $result[0][0]->$result[1][0] );//genero token unico

			array_push( $result, $token ); //agrego el token al array

			echo json_encode( $result );

		}else{

			include_once( $PATH.'core/android/user/logFails.php');

			SaveLogFails(true, $user, $pass, $result[0][0]->$result[1][0] );//guardo el intento fallido de login con la foranea

			echo $GLOBALS['resUA4'];
		}

	}else{

		echo $GLOBALS['resB2'];

	}

?>