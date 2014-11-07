var usuario = "";
var privilegio = false;

$(document).ready(function() {
	$("#divBombilla").append("<img id=\"bombilla\" src=\"/images/recursos/bombilla_encendida.png\" title=\"Bombilla encendida\" heigth=50% width=50% align=\"center\"/>");
	
	$("#encender").click(function() {

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
	});	

	$("#apagar").click(function() {

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
	});	


});


