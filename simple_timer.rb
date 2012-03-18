require 'sinatra'
 
before do
  ## Basic blacklisting of metacharacters
  redirect to "/exception" if request.path_info =~ /\;|\|/
end
 
get '/' do
  @minutes = "05"
  erb :index
end

get '/exception' do
  "sorry, that's not allowed, request contains bad data"
end

get '/:mins' do
  @minutes = "0#{params[:mins]}"
  erb :index
  
end
