require 'sinatra'
 
before do
  ## Basic blacklisting of metacharacters
  redirect to "/exception" if request.path_info =~ /\;|\|/
end
 
get '/' do
  @minutes = 5
  erb :index
end

get '/exception' do
  "sorry, that's not allowed, request contains bad data"
end

get '/countdown/:mins' do
  @minutes = params[:mins]
  erb :index
end

