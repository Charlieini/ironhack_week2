require "pry"
require "sinatra"
require "sinatra/reloader"
require "./lib/search_movie2"


get "/" do
	erb :index
end

post "/search" do 
	@movies = Movies.new
	@movies.search(params[:search])
	# binding.pry
	@posters = @movies.movies
	# binding.pry
	erb :quiz
end

get "/quiz" do
	erb :quiz
end

