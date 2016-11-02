
<?php

	
	chmod("./evidencias", 0777); 


	if ( isset( $_FILES['picture'] ) 
		&& is_uploaded_file( $_FILES['picture']['tmp_name'] ) ){

		$file = basename( $_FILES['picture']['name'] );
		$ruta = "evidencias/".$file;
		copy($_FILES['picture']['tmp_name'], './evidencias/'.$_FILES['picture']['name'].'');

	}else{ echo "No se puede subir"; }


?>

<style>
	form{
		width: 100%;
	}
	input{
		width: 100%;
	}
</style>

<form method="post" enctype="multipart/form-data" action="./upload.php">
	<input type="file" name="picture">
	<input type="submit" value="Enviar">
</form>




