require "pry"
require "sinatra"
require "sinatra/reloader"
require "./lib/search_movie2"


get "/" do
	erb :index
end

post "/search" do 
	@movies = Movies.new(params[:search])
	@selected = @movies.selected
	@random = @movies.selected[rand(9)]
	@year = @random.year
	# binding.pry
	# binding.pry
	erb :quiz2
end

get "/quiz" do
	erb :quiz2
end

post "/guest" do
	@ID = params[:choose]
	@answer = params[:choose]
	if Imdb::Movie.new(@ID).year == @correct
		erb :correct
	else
		erb :Wrong
	end
end
