require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require './lib/operations'

@@memo = 0

get "/" do
	erb :calculator
end

get "/add" do 
	erb :add
end

post "/calculate" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	operator = params[:operator].to_sym
	if operator == :memorize
		destination_file = "./public/memo.txt"
		IO.write(destination_file,@@memo)
	elsif operator == :memo
		file = "./public/memo.txt"
		@first = IO.read(file)
		
	else

		object = Calculator.new(operator,first,second)
		@result = object.calculate
		@@memo=@result
		
	end
	erb :calculator
end





