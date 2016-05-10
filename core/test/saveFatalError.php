<?php
	/*
	Seteo en OFF los mesajes de Error
	*/
	ini_set('display_errors', false);

	error_reporting(-1);

	register_shutdown_function(function(){
		
		$error = error_get_last();
		
		if(null !== $error) {
			//echo $error ( [type] , [message] , [file] , [line] );
			
			echo "<pre>";

			print_r($error['type']);//Capturo el Error
			print_r($error['file']);//Capturo el Error
			print_r($error['line']);//Capturo el Error
			print_r($error['message']);//Capturo el Error
			echo "</pre>"; 
		}

	});

	try{
		//Genero fatal error por falta de Memoria
		trigger_error("No se puede dividir por cero", E_USER_ERROR);
	}
	catch(Exception $exception){
		echo 'Capura de Excepciones!';
	}




?>
- See more at: http://gerardoperrucci.com.ar/php/capturar-fatal-error-en-php#sthash.k6xeJFW5.dpuf