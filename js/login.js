$(document).ready(function(){ 

	$("btn[type=reset]").on("click", function(){
		Limpiar('#loginForm');
	});

	$("#btn_out").on("click", function(){
		window.location = "../index.html";
	});

	$('#loginForm').validate({//validacion del formulario	
	  	errorElement: 'span',
	  	errorClass: 'content-error',
	    rules :{
		    user : {
			  required : true,
			  maxlength: 15
			},
			password : {
			  required : true,
			  maxlength: 50
			}
	    },
	    messages : {
			user:{
			  required: "Campo requerido",
			  maxlength: "Maximo 20 caracteres"
			},
			password:{
			  required : "Campo requerido",
			  maxlength: "Maximo 20 caracteres"
			}
	    },
	    submitHandler: function(form){
   
   			Login(form);
   			
       	},

		invalidHandler:function(form){	
		} 

    });	

});

function Login(form){

	$.ajax({
	beforeSend:function(){

	},
	url:"../core/platform/sesion/login.php",
	data: $(form).serialize(),
	type:"POST",
	error: function(jqXHR,estado,error){
		console.log(jqXHR);
	},
	complete: function(jqXHR,estado){		
		
		var result = JSON.parse( jqXHR.responseText );

		if( ValidateResponseServer( result ) )
			GenerateCookie( result );
				
	},
	setTimeout:10000
  });
}


function GenerateCookie( result ){

	var datos = result.result[0];
	var keys = result.result[1];
	var token = result.result[2];
	

	if(  datos[0][ keys[3] ] == TIPE_USER_ADMIN ||
		datos[0][ keys[3] ] == TIPE_USER_SADMIN || 
		datos[0][ keys[3] ] == TIPE_USER_COORDINADOR ){

		$.cookie('usuario',
			btoa( datos[0][ keys[1] ] ));

		$.cookie('Id_user',
			btoa( datos[0][ keys[0] ] ));

		$.cookie('Tip_user',
			btoa( datos[0][ keys[3] ] ));

		$.cookie('token',
			btoa( token ));

		window.location = "./platform.html";

	}else{
		mbox.alert("Su usuario no esta autorizado (u.u)");
	}

	




}