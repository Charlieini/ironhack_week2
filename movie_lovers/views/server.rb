require "pry"
require "sinatra"
require "sinatra/reloader"
require "./lib/search_movie"


get "/" do
	erb :index
end

post "/search" do 
	@movies = Movies.new
	@actual_movies = movies.search(params[:search])
	# binding.pry
	redirect "/quiz"
end

get "/quiz" do
	erb :quiz
end


