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
	      console.log("Encendiendo luces");
	      window.location.replace('/luces/:encender');
}

function apagar() {
	      console.log("Apagando luces");
	      window.location.replace('/luces/:apagar');
}


