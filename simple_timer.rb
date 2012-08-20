require 'sinatra'
 
before do
  ## Basic blacklisting of metacharacters
  redirect to "/exception" if !(request.path_info =~ /[^0-9].*/)
end
 
get '/' do
  @minutes = "05"
  erb :index
end

get '/exception' do
  "sorry, that's not allowed, request contains bad data"
end

get '/:mins' do
  if params[:mins].to_i >9
    @minutes = "#{params[:mins]}"
  else
    @minutes = "0#{params[:mins]}"
  end
  
  erb :index  
end
