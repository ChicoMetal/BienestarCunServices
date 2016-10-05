<?php
	


	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("../../../PATH.php");				
	}

	
	require_once($PATH.'core/funtion.php');
	require_once($PATH.'core/target_peticion.php'); //################ habilitar

	//1111 = Super Administrador
	//1110 = Administrador
	//1101 = Administrador de circulo
	//1100 = Docente CUN
	//1011 = Estudiante
	//1010 = Estudiante egresado
	//1001 = Psicologa
	//1000 = Usuario sin loguear

	$tipeUser = Array( 
			"sadmin" 		=> "1111",
			"admin" 		=> "1110",
			"admincircle" 	=> "1101",
			"docente" 		=> "1100",
			"estudiante" 	=> "1011",
			"egresado" 		=> "1010",
			"psicologia" 	=> "1001",
			"user" 			=> "1000"
		);


?>