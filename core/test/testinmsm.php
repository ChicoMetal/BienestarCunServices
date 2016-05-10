<?php
	
	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../PATH.php");				
	}

	include_once('../mesages.php');
	include_once('../android/user/mesages_user.php');
	include_once('../android/circles/mesages_circles.php');
	include_once('../android/desertion/mesages_desertion.php');

	print_r($GLOBALS);
?>