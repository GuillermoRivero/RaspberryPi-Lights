require 'omniauth-oauth2'
require 'omniauth-google-oauth2'

use OmniAuth::Builder do
  google_config = YAML.load_file 'config/google_config.yml'
  provider :google_oauth2, google_config['identifier']#, google_config['secret'], {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end

get '/auth/:name/callback' do
  
  session[:auth] = @auth = request.env['omniauth.auth']
  session[:name] = @auth['info'].name
  session[:image] = @auth['info'].image

  redirect '/'
end

get '/auth/failure' do
  flash[:notice] = params[:message] 
  redirect '/'
end
