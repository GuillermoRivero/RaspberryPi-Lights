$:.unshift "."
require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'pi_piper'

include PiPiper

set :bind, '0.0.0.0'
set :port, 80

pinLuz = PiPiper::Pin.new(:pin => 24, :direction => :out)
pinLuz.on


helpers do
  def current?(path='/')
    (request.path==path || request.path==path+'/') ? 'class = "current"' : ''
  end
end

get '/' do
   erb :index
end

get '/luces' do
  erb :luces
end

get '/encender' do
  pinLuz.off
  erb :luces
end

get '/apagar' do
  pinLuz.on
  erb :luces
end
