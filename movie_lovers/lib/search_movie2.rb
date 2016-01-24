require "rubygems"
require "imdb"
require "pry"

class Movies

	attr_accessor :imdb_search, :selected, :IDs, :posters

	def initialize(search)
		@imdb_search = Imdb::Search.new(search).movies.to_enum
		@selected = []
		@random_question = nil
		# binding.pry
		select_movies
	end

	def select_movies

		until @selected.length == 9 
			# actual_id = @imdb_search.next.id
			actual = Imdb::Movie.new(@imdb_search.next.id)
			# binding.pry
			if actual.poster != nil 
				@selected << actual 
			end
		end

	end

	def random_question

		 @random_movie = @selected[rand(@selected.length)]

	end


end

# Movies.new("love")