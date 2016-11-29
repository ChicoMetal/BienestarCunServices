<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	$user 			= isset( $_POST["user"] )			? ReplaceCharacter($_POST["user"]) 			: '';
	$token 			= isset( $_POST["token"] )			? ReplaceCharacter($_POST["token"]) 		: '';
	$json 			= isset( $_POST["listObject"] )		? ReplaceCharacter($_POST["listObject"]) 	: '';

	if( $user != '' && $token != '' && $json != '' && ValidateToken( $token, $user ) ){

		$object = json_decode( $json );

		$size = count( $object[0] );
		
		$item0 = $object[1]->item0;
		$item1 = $object[1]->item1;

		$sqlInsert = "VALUES";

		foreach ( $object[0] as $key => $value) {
			
			$presencia 	= $value -> $item1;
			$usuario 	= $value -> $item0;
			$itinerario = $object[2];

			$sqlExists = "SELECT Count(*) AS tomada 
							FROM asistencias 
							WHERE Itinerario = '$itinerario' AND Usuario = '$usuario' ";

			$resultExists = json_decode( BuscarDatos( $sqlExists ) );//verifico que no se halla guardado ya una asistencia
			
			$resultExists = $resultExists->result;

			if( $resultExists[0] != "msm" ){

				$data = $resultExists[0];
				$index =  $resultExists[1];
				
				if(  $data[0] -> $index[0] == 0 ){ //si ya esta tomada la asistencia la omito

					$sqlInsert .= "('$presencia','$usuario','$itinerario')";

					if( $key < $size - 1  )
						$sqlInsert .= ",";

				}

			}

		}
		
		if( $sqlInsert != "VALUES" ){//verifico que quede algun registro por insertar

			$sql = "INSERT INTO asistencias(Presencia, Usuario, Itinerario) ".$sqlInsert;
			
			echo InsertarDatos( $sql );

		}else{
			echo  $GLOBALS['resB2'];
		}

	}else{

		echo  $GLOBALS['resB2'];

	}
		

?>