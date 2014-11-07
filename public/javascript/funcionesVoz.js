$(document).ready(function() {
	if (annyang) {
	  var commands = {
	    'encender': encender,
	    'apagar': apagar
	  };
	  annyang.addCommands(commands);
	  annyang.setLanguage('es-ES');
	  annyang.debug();
	  annyang.start();
	}
});

function encender() {
	    $.get("/usuario", function(data){
			usuario = data.usuario;
		});

		$.post("/luces/accion",{
			estado:"encender",
		    usuario: usuario
		}, function(data){
			if(data.permisos == "ADMINISTRADOR"){
				privilegio = true;
			}else{
				privilegio = false;
			}
		}).done(function(){
			if(privilegio == true){
				$("#bombilla")[0].src = "/images/recursos/bombilla_encendida.png";
			}
		}).fail(function(){
			alert("Fallo al conectar al servidor");
		});
}

function apagar() {
	    $.get("/usuario", function(data){
			usuario = data.usuario;
		});

		$.post("/luces/accion",{
		      estado:"apagar",
		      usuario: usuario
		}, function(data){
			if(data.permisos == "ADMINISTRADOR"){
				privilegio = true;
			}else{
				privilegio = false;
			}
		}).done(function(){
			if(privilegio == true){
				$("#bombilla")[0].src = "/images/recursos/bombilla_apagada.png";
			}
		}).fail(function(){
			alert("Fallo al conectar al servidor");
		});
}


