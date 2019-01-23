require 'sinatra/base'


class Calendar < Sinatra::Base
  enable :sessions

  get '/' do
    erb :greeter
  end

  post '/birthday' do
    p params
    session[:entered_name] = params[:entered_name]
    redirect '/your_birthday'
  end

  get '/your_birthday' do
    @entered_name=session[:entered_name]
    erb :birthday
  end

  # start the server if ruby file executed directly
  run! if app_file ==$0
end
