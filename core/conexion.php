<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar
	require_once($PATH."core/mesages.php");


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

	function InsertarDatos( $sql ){

		$conexion = ConexionMysql();

		if( !is_object( $conexion ) || !mysqli_ping( $conexion ) ){ //verifico que la conexion sea correcta

			return json_decode( $GLOBALS[ 'resA1' ] );

		}

		return mysqli_query( $conexion, $sql ) ? $GLOBALS[ 'resA4' ]: 
												 $GLOBALS[ 'resA2' ]; //Insertar datos
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


?>