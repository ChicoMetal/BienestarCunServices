<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar

	$resUA1 = '["msm","11111"]'; /* Usuario activo */
	$resUA2 = '["msm","10000"]'; /* usuario inexistente */
	$resUA3 = '["msm","10001"]'; /* Usuario bloqueado*/
	$resUA4 = '["msm","10010"]'; /* Combinacion erronea */
	$resUA5 = '["msm","10110"]'; /* Sesion finalizada */
	
?>
