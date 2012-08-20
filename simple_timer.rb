require 'sinatra'

get '/' do
  @minutes = "05"
  erb :index
end

get '/:mins' do
  if params[:mins] =~ /^\d*$/
    if params[:mins].to_i >9
      @minutes = "#{params[:mins]}"
    else
      @minutes = "0#{params[:mins]}"
    end
    erb :index    
  else
    "this is why we can't have nice things." 
  end
end