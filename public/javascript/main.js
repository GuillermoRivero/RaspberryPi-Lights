$(document).ready(function() {

	


});

function comprobarEstado(){

		if($("#estado").val == "encender"){
			window.location.replace('/luces/:encender');
		}
		if($("#estado").val == "apagar"){
			window.location.replace('/luces/:apagar');
		}
};  

