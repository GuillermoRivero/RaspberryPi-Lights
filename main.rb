$:.unshift "."
require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'json'
require 'pi_piper'

include PiPiper

set :bind, '0.0.0.0'
set :port, 80

pinLuz = PiPiper::Pin.new(:pin => 24, :direction => :out)
pinLuz.on

$encendida = false;





helpers do
  def current?(path='/')
    (request.path==path || request.path==path+'/') ? 'class = "current"' : ''
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
  if params[:estado] == ':encender'
		$encendida = true
		pinLuz.off
  else
		$encendida = false
		pinLuz.on
  end
  erb :luces

end


