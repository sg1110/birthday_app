require 'sinatra/base'
require 'date'


class Calendar < Sinatra::Base
  enable :sessions

  get '/' do
    erb :greeter
  end

  post '/birthday' do
    p params
    session[:entered_name] = params[:entered_name]
    session[:entered_date] = params[:entered_date]

    @date=session[:entered_date].to_s
    @todays_date = Date.today.to_s
    redirect '/your_birthday' if @date == @todays_date
  end

  get '/your_birthday' do
    @entered_name=session[:entered_name]
    @date=session[:entered_date]
    erb :birthday
  end

  # start the server if ruby file executed directly
   run! if app_file ==$0
end
