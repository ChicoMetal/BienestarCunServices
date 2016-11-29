<?php
	//111 Pendiente
	//110 Aplazado
	//000 Cancelado


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/constant.php');
	require_once($PATH.'core/mesages.php');

	$user 	= isset( $_POST["user"] )		? ReplaceCharacter($_POST["user"]) 		: '';

	if( $user != ''){

		$sql = "SELECT id, Tipo FROM usuarios WHERE id = '$user'";

		$result = json_decode( BuscarDatos( $sql ) );

		$result = $result->result;
		
		if( is_object( $result[1] ) ){
			$index = 1;
			$key = $result[1]->$index;	
		}

		if( $result[0] == 'msm' ){

			echo  $GLOBALS['resB2'];

		}else{

			if( $result[0][0]->$key == $GLOBALS['tipeUser']["sadmin"] 
				|| $result[0][0]->$key == $GLOBALS['tipeUser']["admin"]  ){//pregunto el tipo de usuario

				$sql = "SELECT n.id, n.Fecha, n.Notificacion, n.Estado, c.Nombre
						FROM notificaciones n, circulos c, usuarios u, personas p, sede s
						WHERE u.id = p.Identificacion 
						AND p.Sede = s.id 
						AND s.id = c.Sede
						AND c.id = n.Circulo
						AND n.Fecha >= NOW()
						GROUP BY n.id";//busco notificaciones

			}else{

				$sql = "SELECT n.id, n.Fecha, n.Notificacion, n.Estado, c.Nombre
						FROM notificaciones n, circulos c, usuariocirculo uc, usuarios u
						WHERE n.Circulo = c.id AND uc.Circulo = c.id  AND uc.Usuario = u.Id
							AND n.Fecha >= NOW() AND uc.Usuario = '$user'";//busco circulos que el usuario no tenga inscritos

				
			
			}
			
			echo BuscarDatos( $sql );

			
		}


	}else{

		echo  $GLOBALS['resB2'];

	}

?>