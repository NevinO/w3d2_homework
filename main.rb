require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'date'

get '/' do
  erb :home
end

get '/about_us' do
  erb :about_us
end

get '/age' do
  if params[:dob]
    @today = Date.today
    @dob = Date.parse(params[:dob])

    @age_result = @today.year - @dob.year - ((@today.month > @dob.month || (@today.month == @dob.month && @today.day >= @dob.day)) ? 0 : 1)
  end

  erb :age
end


get '/faqs' do
  erb :faqs
end


get '/calculator' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

@calculator = case @operator
when '+'
  @first_number + @second_number
when '-'
  @first_number - @second_number
when '*'
  @first_number * @second_number
when '/'
  @first_number / @second_number
end

  erb :calculator
end

get '/multiply/:x/:y' do
  @calculator = params[:x].to_i * params[:y].to_i
  erb :calculator
end