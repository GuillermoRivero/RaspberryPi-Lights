$:.unshift "."
require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'

set :bind, '0.0.0.0'
set :port, 80

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
