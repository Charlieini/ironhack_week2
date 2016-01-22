require "pry"
require "sinatra"
require "sinatra/reloader"
require "./lib/search_movie"


get "/" do
	erb :index
end

post "/search" do 
	@movies = Movies.new
	@movies.search(params[:search])
	# binding.pry
	@posters = @movies.movies
	@random = @posters[rand(@posters.length)]
	@year = @random.year

	# binding.pry
	erb :quiz
end

post "/guest" do
	@ID = params[:choose]
	@correct = params[:correct]
	if Imdb::Movie.new(@ID).year == @correct
		erb :correct
	else
		erb :Wrong
	end
end


