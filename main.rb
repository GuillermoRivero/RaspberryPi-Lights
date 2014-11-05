$:.unshift "."
require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'json'
require 'pi_piper'
require 'auth'

#PiPiper
include PiPiper
pinLuz = PiPiper::Pin.new(:pin => 24, :direction => :out)
pinLuz.on

# Oauth
enable :sessions
set :session_secret, '*&(^#234)'
set :reserved_words, %w{grammar test login auth}
$administrador = 'Guillermo Rivero'

#Sinatra
set :bind, '0.0.0.0'
set :port, 80

#Variables estado
$encendida = false;


helpers do
  def current?(path='/')
    (request.path==path || request.path==path+'/') ? 'class = "current"' : ''
  end

  def inSession?()
        if session[:auth] # authenticated
		"<img class=\"borderradius\" src=\"#{session[:image]}\" width=\"35\" height=\"35\"> Logueado como <b>#{session[:name]}</b>. ¿Cambiar cuenta?"
	else
		"Identificate como, <b>administrador</b> para poder moficar el estado de las luces"
	end
  end 

  def estaEncendida?()
        if $encendida
		return "<img src=\"/images/recursos/bombilla_encendida.png\" title=\"Bombilla encendida\" heigth=50% width=50% align=\"center\"/>"
		
	else
		return "<img src=\"/images/recursos/bombilla_apagada.png\" title=\"Bombilla apagada\" heigth=50% width=50% align=\"center\"/>"
	end
  end 

end

get '/' do
   erb :index
end

get '/luces' do
  erb :luces
end

get '/luces/estado' do
	content_type :json
	{valor: $encendida}.to_json
end

get '/luces/:estado' do
	if session[:name] == $administrador
	  if params[:estado] == ':encender'
			$encendida = true
			pinLuz.off
	  else
			$encendida = false
			pinLuz.on
	  end
	end
  erb :luces

end


