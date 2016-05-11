<?php 

	$remi 	= isset( $_POST["remitente"] )		? $_POST["remitente"] 		: '';
	$des 	= isset( $_POST["destinatario"] )		? $_POST["destinatario"] 		: '';

	echo ("Se han enviado: ".$remi. " y ".$des);

 ?>