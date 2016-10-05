<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$user 			= isset( $_POST["user"] )		? $_POST["user"] 		: '';
	$empresa 		= isset( $_POST["empresa"] )	? $_POST["empresa"] 	: '';
	$cargo			= isset( $_POST["cargo"] )		? $_POST["cargo"] 		: '';
	$dateStart 		= isset( $_POST["dateStart"] )	? $_POST["dateStart"] 	: '';
	$dateEnd 		= isset( $_POST["dateEnd"] )	? $_POST["dateEnd"] 	: '';



	if( $user != '' && $empresa != ''&& $cargo != ''&& $dateStart != ''){

		$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

		$result = BuscarDatos( $sql );

		if( $result[0] != "msm" ){//si ya se creo la relacion entre el egresado y laboral


			$result = SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd, $user );

			echo ('{"result":  '.$result.'  }' );

			
		}else{//En caso no este creada la relacion de egresado y laboral, la creo

			$sql = "INSERT INTO laboralegresado(Id) VALUES('$user')";

			$result = InsertarDatos( $sql );

			if( $result == json_decode( $GLOBALS['resA4'] ) ){//verifico la creacion de la relacion

				$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

				$result = BuscarDatos( $sql );

				if( $result[0] != "msm" ){//confirmo una ves mas que este creada la relacion

					$result = SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd, $user );

					echo ('{"result":  '.$result.'  }' );					

				}else{
					
					echo ('{"result":  '.$result.'  }' );

				}

			}else{

				echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );
			}

		}


	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
	

	function SaveHistory( $result, $empresa, $cargo, $dateStart, $dateEnd , $user){
		//guarda el historial 

		$Codigo = $result[0][0]->$result[1][0];

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

		$result = json_encode( $result );

		return $result;
	}

?>

