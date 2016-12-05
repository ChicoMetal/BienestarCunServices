$(document).ready(function(){

	 $('select').material_select();
	  

	 getSedes();

	 $('#formUser').validate({//validacion del formulario	
	  	errorElement: 'span',
	  	errorClass: 'content-error',
	    rules :{
		    Identificacion : {
			  required : true,
			  number: true,
			  maxlength: 15
			},
			first_name : {
			  required : true,
			  maxlength: 50
			},
			Apellidos : {
			  required : true,
			  maxlength: 50
			},
			Contacto : {
			  required : true,
			  number: true,
			  maxlength: 10
			},
			Email : {
			  required : true,
			  email: true,
			  maxlength: 100
			},
			Direccion : {
			  required : true,
			  maxlength: 100
			},
			Edad : {
			  required : true,
			  number: true,
			  maxlength: 3
			},
			User : {
			  required : true,
			  maxlength: 20
			},
			password : {
			  required : true,
			  maxlength: 20
			},
			confirm_pas : {
			  required : true,
			  maxlength: 20
			}
	    },
	    messages : {
			Identificacion:{
			  required: "Campo requerido",
			  number: "Solo valores numericos",
			  maxlength: "Maximo 15 caracteres"
			},
			first_name:{
			  required : "Campo requerido",
			  maxlength: "Maximo 50 caracteres"
			},
			Apellidos:{
			  required : "Campo requerido",
			  maxlength: "Maximo 50 caracteres"
			},
			Contacto:{
			  required : "Campo requerido",
			  number: "Solo valores numericos",
			  maxlength: "Maximo 10 caracteres"
			},
			Email:{
			  required: "Campo requerido",
			  email: "Ingrese un email valido",
			  maxlength: "Maximo 100 caracteres"
			},
			Direccion:{
			  required : "Campo requerido",
			  maxlength: "Maximo 100 caracteres"
			},
			Edad:{
			  required : "Campo requerido",
			  number: "Solo valores numericos",
			  maxlength: "Maximo 3 caracteres"
			},
			User:{
			  required : "Campo requerido",
			  maxlength: "Maximo 20 caracteres"
			},
			password:{
			  required : "Campo requerido",
			  maxlength: "Maximo 20 caracteres"
			},
			confirm_pas:{
			  required : "Campo requerido",
			  maxlength: "Maximo 20 caracteres"
			}
	    },
	   /* errorPlacement: function(error, element) {
		    console.log(error)
		    element.parents(".input-field").appendTo("<small></small>")
		    error.appendTo( element.siblings("<small>") );
		  },
		showErrors: function(errorMap, errorList) {
		  $(".contentError").html("El formulario contiene "
		      + this.numberOfInvalids()
		      + " errores.");		    
		},*/
	    submitHandler: function(form){
    
    		var selects = ValidateSelect( $(form).attr("id") ); //obtengo select del formulario
   			if ( selects != 0 ){
   				mbox.alert("El selector ( "+selects+" ) es invalido" );
   			}else if( !($("#password").val() === $("#confirm_pas").val()) ){//valido que los pass sean iguales
   				mbox.alert("Las contraseñas no son iguales");
   			}else{
   				SendDatos( form );
   			}

       	},

		invalidHandler:function(form){	
		} 

    });	

	$('#btn_admin').on('click', function(){
		window.location = "./Navigation/";
	});

	$("btn[type=reset]").on("click", function(){
		Limpiar('#formUser');
	});

});


function getSedes(){
//Obtener las sedes registradas
	$.ajax({
	beforeSend:function(){

	},
	url:"./core/platform/index/getSedes.php",
	type:"POST",
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result, true ) )
			AddOptions(result,".sedes");
				
	},
	setTimeout:10000
  });
}

function SendDatos( form ){
//guardar los datos

	$.ajax({
		beforeSend:function(){

		},
		url:"./core/platform/index/savePerson.php",
		method:"POST",
		data: $(form).serialize(),
		success: function( res){
								
		},
		error: function(jqXHR,estado,error){
			console.log(jqXHR);
		},
		complete: function(jqXHR,estado){		
			
			var result = JSON.parse( jqXHR.responseText );

			if( ValidateResponseServer( result ) ){
				mbox.alert("Listo! ahora solo queda esperar que se active tu usuario (^.^)");
				
			}

		},
		setTimeout:10000
	});
}