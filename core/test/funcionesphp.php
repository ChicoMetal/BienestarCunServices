<?php 

if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../PATH.php");				
	}


require_once($PATH.'core/conexion.php');
	
	$expresion = "/ |[[:space:]]|,|\(|\)|\n|\t/";

	$sql = "UPDATE laboralegresado SET Laborando = true WHERE Id = 1104379";

	Auditoria2( $sql, 1104379, getOld2($sql) );

	function Auditoria2( $sql, $user, $old ){
		//genera informe para guardar los movimientos

		$fragment = preg_split($GLOBALS['expresion'],$sql, -1, PREG_SPLIT_NO_EMPTY); 

		$table = getTable2( $fragment );

		$sql = addslashes( $sql );

		if( $table != null && $table != "" ){

			if( $user != null && $old != null){

				$sql = "INSERT INTO auditoria(Tabla, Accion, Old, User) 
						VALUES('$table', '$sql', '$old', '$user')";
			}elseif( $user != null ){

				$sql = "INSERT INTO auditoria(Tabla, Accion, User) 
						VALUES('$table', '$sql', '$user')";

			}else{
				$sql = "INSERT INTO auditoria(Tabla, Accion, Old) 
						VALUES('$table', '$sql', '$old')";
			}

			$res = InsertarDatos( $sql, false );
			exit;
		}else{
			echo "hola";
		}


	}

	function getTable2( $fragments ){
	//obtener el nombre de la tabla

		for( $c = 0; $c < count( $fragments ); $c++){
			if( $fragments[ $c ] == "FROM" 
				|| $fragments[ $c ] == "INTO" 
				|| $fragments[ $c ] == "UPDATE" ){
				
				return $fragments[ $c+1 ];
			}
		}

		return null;
	} 

	function getOld2( $sql ){
	//obtener informacion vieja 

		$fragment = preg_split($GLOBALS['expresion'], $sql, -1, PREG_SPLIT_NO_EMPTY); 

		$table = getTable2( $fragment );

		if( $fragment[0] != "INSERT" ){

			for( $c = 0; $c < count( $fragment ); $c++ ){

				if( $fragment[ $c ] != "WHERE" ){

					unset( $fragment[ $c ] );

				}else{

					$condition = implode(" ", $fragment );

					$sql = "SELECT * FROM ".$table." ".$condition;

					$response = BuscarDatos( $sql );

					if ( $response[0] == "msm"  ){//Verifico si la respuesta es un objeto
						return null;
					}else{

						$response = json_decode( $response );

						$response = $response->result;

						$response = $response[0][0];

						return json_encode( $response );
					}

					break;
				}

				return null;
			}
		}


		return null;
	}
 ?>