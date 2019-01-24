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

    @date=session[:entered_date]
    @todays_date = Date.today.to_s
    redirect '/your_birthday' if @date == @todays_date
    redirect '/not_your_birthday' if @date != @todays_date

  end

  get '/your_birthday' do
    @entered_name=session[:entered_name]
    @date=session[:entered_date]
    erb :birthday
  end

  get '/not_your_birthday' do
    @entered_name=session[:entered_name]
    @date=session[:entered_date]

    #calculates age in days
    @date=Date.parse(@date)
    @todays_date = Date.today
    @age=(@todays_date-@date).to_i

    next_year = Date.today.year + 1
    next_bday = "#{@date.day}-#{@date.month}-#{next_year}"

    @days_left = ((Date.parse(next_bday) - Date.today).to_i)-365
      if @days_left > 0   # if the date has not passed this year
        @days_left
      elsif @days_left < 0 #if the date has already passed this year
        @days_left += 365
      end

    erb :not_birthday
  end

  # start the server if ruby file executed directly
   run! if app_file ==$0
end
