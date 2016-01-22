require "rubygems"
require "imdb"
require "pry"

class Movies

	attr_accessor :titles, :selected, :IDs, :posters, :movies

	def initialize
		@titles = []
		@selected = []
		@IDs =  []
		@posters =[]
		@movies = []
	end

	def search(key)
		@titles = Imdb::Search.new(key)
		extract_only_15
	end

	def extract_only_15
		@titles.movies[0..14].each do |movie|
			@selected << movie
		end
		define_IDs
	end

	def define_IDs
		@selected.each {|selected| @IDs << selected.id }
		# binding.pry
		extract_posters
		# store_movies
	end

	def extract_posters
		@IDs.each do |id| 
			if Imdb::Movie.new(id).poster != nil
				@posters << Imdb::Movie.new(id).poster
				@movies << Imdb::Movie.new(id)
				# binding.pry
			end
		end

		# delete_no_poster
		# binding.pry
	end

	# def delete_no_poster
	# 	@posters.delete_if{|url| url == nil}
	# end

end

# movies = Movies.new
# movies.search("Sharknado")
# puts movies.posters
