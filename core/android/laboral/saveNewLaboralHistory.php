<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 			: '';
	$token 			= isset( $_POST["token"] )		? ReplaceCharacter($_POST["token"]) 		: '';
	$empresa 		= isset( $_POST["empresa"] )	? ReplaceCharacter($_POST["empresa"]) 		: '';
	$cargo			= isset( $_POST["cargo"] )		? ReplaceCharacter($_POST["cargo"]) 		: '';
	$dateStart 		= isset( $_POST["dateStart"] )	? ReplaceCharacter($_POST["dateStart"]) 	: '';
	$dateEnd 		= isset( $_POST["dateEnd"] )	? ReplaceCharacter($_POST["dateEnd"]) 		: '';



	if( $user != '' && $token != '' && $empresa != ''&& $cargo != ''&& $dateStart != '' && ValidateToken( $token, $user ) ){

		$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

		$result = json_decode( BuscarDatos( $sql ) );

		$result = $result->result;

		if( $result[0] != "msm" ){//si ya se creo la relacion entre el egresado y laboral

			echo SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd, $user );
			
		}else{//En caso no este creada la relacion de egresado y laboral, la creo

			$sql = "INSERT INTO laboralegresado(Id) VALUES('$user')";

			$result =  InsertarDatos( $sql );			

			if( $result == $GLOBALS['resA4'] ){//verifico la creacion de la relacion

				$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

				$result = json_decode( BuscarDatos( $sql ) );

				$result = $result->result;

				if( $result[0] != "msm" ){//confirmo una ves mas que este creada la relacion

					echo SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd, $user );
				
				}else{
					
					echo $result;

				}

			}else{

				echo  $GLOBALS['resB2'];
			}

		}


	}else{

		echo  $GLOBALS['resB2'];

	}
	

	function SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd , $user){
		//guarda el historial 

		$index = 0;
		$clave = $result[1]->$index;
		$Codigo = $result[0][0]->$clave;

		if( $dateEnd != '' ){

			$sql = "INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, FechaFin, LaboralEgresado)
			 VALUES('$empresa', '$cargo', '$dateStart', '$dateEnd', '$Codigo')";
		
		}else{

			$sql = "INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, LaboralEgresado)
			 VALUES('$empresa', '$cargo', '$dateStart', '$Codigo')";

			 $sqlStatus = "UPDATE laboralegresado SET Laborando = true WHERE Id = '$user' ";

			 InsertarDatos( $sqlStatus );//actualizar estado laboral a laborando

		}

		$result =  InsertarDatos( $sql );//guardo el historial enviado

		return $result;
	}

?>

