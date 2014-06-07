$(document).ready(function() {

	var gpio = require("pi-gpio");

	gpio.open(18, "output", function(err) {
		console.log(err);	
	});

	$('#encender').click(function() {

		gpio.write(18, 1, function() {}); /*Pin 18 Encendido*/
   
	});  

	$('#apagar').click(function() {
		gpio.write(18, 0, function() {}); /*Pin 16 Apagado*/
	});




});


