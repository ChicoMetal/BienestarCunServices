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

		if( is_array( $result ) ){


			$idle = $result[0][0]->$result[1][0];

			if( $dataEnd != '' ){

				$sql = "INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, FechaFin, LaboralEgresado)
				 VALUES('$empresa', '$cargo', '$dateStart', '$dateEnd', '$idle')";
			
			}else{

				$sql = "INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, LaboralEgresado)
				 VALUES('$empresa', '$cargo', '$dateStart', '$idle')";

			}


			echo InsertarDatos( $sql );

			
		}else{

			$sql = "INSERT INTO laboralegresado(Id) VALUES('$user')";

			$result = InsertarDatos( $sql );

			if( $result == $GLOBALS[ 'resA4' ] ){

				$sql = "SELECT Id, Laborando FROM laboralegresado WHERE Id = '$user'";

				$result = BuscarDatos( $sql );

				if( is_array( $result ) ){


					$idle = $result[0][0]->$result[1][0];

					$sql = "INSERT INTO historiallaboral(Empresa, Cargo, FechaInicio, FechaFin, LaboralEgresado)
					 VALUES('$empresa', '$cargo', '$dateStart', '$dateEnd', '$idle')";

					echo InsertarDatos( $sql );					

				}else{
					echo $result;
				}

			}else{

				echo $GLOBALS['resB2'];
			}

		}


	}else{

		echo $GLOBALS['resB2'];

	}
		

?>

