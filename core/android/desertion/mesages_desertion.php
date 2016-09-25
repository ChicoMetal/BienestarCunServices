<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	require_once($PATH.'core/target_peticion.php'); //################ habilitar

	$resDA1 = '["msm", "00"]';	//No existe el usuario a reportar

?>