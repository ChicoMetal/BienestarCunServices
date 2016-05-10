<?php


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); 
	require_once($PATH.'core/conexion.php');
	require_once($PATH.'core/mesages.php');

	chmod("./evidencias", 0777); 

	$ruta = "evidencias/" .basename($_FILES['fotoUp']['name']);
	
	if(move_uploaded_file($_FILES['fotoUp']['tmp_name'], $ruta))
	       chmod ("uploads/".basename( $_FILES['fotoUp']['name']), 0644);

?>

