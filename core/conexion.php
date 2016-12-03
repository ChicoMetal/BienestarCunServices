<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar
	require_once($PATH."core/mesages.php");

	$expresion = "/ |[[:space:]]|,|\(|\)|\n|\t/";//expresion regular para separar sql

	function BuscarDatos( $sql ){

		$conexion = conexionMysql();

		if( !is_object( $conexion) ){

			return ( $GLOBALS['resA1'] );

		}


		$respuesta = mysqli_query( $conexion, $sql ); //Obtengo los datos del usuario

		if ( !$respuesta ) { //verifico si existen resultados

			return( $GLOBALS['resA3'] ); //no existen datos

		}else{

			if( ( $respuesta->num_rows ) >0 ){ //verifico si existen resultados

				$num_cols = $respuesta->field_count; //obtener numero de columnas de la consulta

				while( $num_cols > 0 ){ //creo array con el nombre de las columnas de la consulta

					$index[$num_cols-1] =$respuesta->fetch_field_direct( $num_cols-1 )->name; //(devuelve el nombre del campo)
				
					$num_cols--;
				}

				$i = 0;
				
				while ( $resultado = $respuesta->fetch_object() ) { // creo un JSON array con los resultados de la consulta

				       $rows[$i] = $resultado;
				       $i++;

				}			
			
				$result = json_encode( array($rows,$index) );//array con resultados e indices

				return ('{"result":  '.$result.'  }' );
	
			}else{

				return( $GLOBALS['resA3'] );  //no existen datos
			}
		}					
	}

	function InsertarDatos( $sql, $auditar=true, $user=null ){


		$conexion = ConexionMysql();

		if( !is_object( $conexion ) || !mysqli_ping( $conexion ) ){ //verifico que la conexion sea correcta

			return json_decode( $GLOBALS[ 'resA1' ] );

		}

		$old = null;

		if( $user != null ){
			$old = getOld( $sql );//obtener datos actuales en caso de modificaciones 
		}

		if ( mysqli_query( $conexion, $sql ) ){
			
			if( $auditar ){//saber si la funcion auditar es la que estar realizando la insercion
				Auditoria( $sql, $user, $old );			
			}

			return $GLOBALS[ 'resA4' ];
		}else{
			return $GLOBALS[ 'resA2' ];
		}

	}

	function ConexionMysql(){

		$datosC = datosConexion();

		//1. Crear conexión a la Base de Datos
		$conexion = mysqli_connect( 
						$datosC->bd_host, 
						$datosC->bd_usuario,
						$datosC->bd_password
					);	
		
		if ( !$conexion ) {

			return $GLOBALS[ 'resA1' ];

		}else{

			$conexion->set_charset("utf8");//cambio el conjunto de caracteres para aceptar ñ y acentos

			//2. Seleccionar la Base de Datos a utilizar
			$seleccionar_bd = mysqli_select_db( $conexion, $datosC->bd_base );

			if ( !$seleccionar_bd ) {

				return  $GLOBALS[ 'resA5' ];

			}else{

				
				return $conexion;

			}
			//4. Cerrar conexión a la Base de Datos
			mysqli_close( $conexion );

		}
	}

	function DatosConexion(){

		$datosConexion = '{
			"bd_host" 		: "www.db4free.net", 
			"bd_usuario" 	:  "krlos1991", 
			"bd_password" 	:  "19915991",
			"bd_base" 		:  "bienestarcun"
		}';

		/*$datosConexion = '{
			"bd_host" 		: "localhost", 
			"bd_usuario" 	:  "root", 
			"bd_password" 	:  "",
			"bd_base" 		:  "bienestarcun"
		}';*/

		/*$datosConexion = '{
			"bd_host" 		: "localhost", 
			"bd_usuario" 	:  "ottsinc_examen", 
			"bd_password" 	:  "examen0000",
			"bd_base" 		:  "ottsinc_bienestarcun"
		}';*/

		$datosConexion = json_decode( $datosConexion );

		return $datosConexion;
	}

	function Auditoria( $sql, $user, $old ){
		//genera informe para guardar los movimientos

		$fragment = preg_split($GLOBALS['expresion'],$sql, -1, PREG_SPLIT_NO_EMPTY); 

		$table = getTable( $fragment );

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

			InsertarDatos( $sql, false );

		}else{
			echo "hola";
		}
	}

	function getTable( $fragments ){
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

	function getOld( $sql ){
	//obtener informacion vieja 

		$fragment = preg_split($GLOBALS['expresion'], $sql, -1, PREG_SPLIT_NO_EMPTY); 

		$table = getTable( $fragment );

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