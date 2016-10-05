<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');


	$json 			= isset( $_POST["listObject"] )			? $_POST["listObject"] 			: '';

	if( $json != '' ){

		$object = json_decode($json);
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

			$resultExists = BuscarDatos( $sqlExists );//verifico que no se halla guardado ya una asistencia
			
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
			
			$result = InsertarDatos( $sql );
			
			$result = json_encode( $result );

			echo ('{"result":  '.$result.'  }' );

		}else{
			echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );
		}

	}else{

		echo  ('{"result":  '.$GLOBALS['resB2'].'  }' );

	}
		

?>