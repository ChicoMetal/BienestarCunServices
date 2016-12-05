$(document).ready(function(){

	if(  atob( $.cookie("Tip_user") ) != TIPE_USER_ADMIN &&
		atob( $.cookie("Tip_user") ) != TIPE_USER_SADMIN && 
		atob( $.cookie("Tip_user") ) != TIPE_USER_COORDINADOR ){

		window.location = "./index.html";

	}

	$("#btn_out").on("click", function(){
		window.location = "./index.html";
	});

});