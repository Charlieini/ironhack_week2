require "rubygems"
require "imdb"
require "pry"

class Movies

	attr_accessor :titles, :selected, :IDs, :posters

	def initialize
		@titles = []
		@selected = []
		@IDs =  []
		@posters =[]
	end

	def search(key)
		@titles = Imdb::Search.new(key)
		define_IDs
		extract_only_9(0)
	end

	def define_IDs
		@titles.movies.each {|selected| @IDs << selected.id }
		# binding.pry
		# extract_posters
	end

	def extract_only_9(n)
		if @selected.length < 9 
			if Imdb::Movie.new(@IDs[n]).poster != nil
				@selected << Imdb::Movie.new(@IDs[n])
				extract_only_9(n+1)
			else 
				extract_only_9(n+1)
			end
			# binding.pry
		end
		extract_posters
	end

	def extract_posters
		@selected.each {|id| @posters << id.poster}
		# delete_no_poster
		# binding.pry
	end

	# def delete_no_poster
	# 	@posters.delete_if{|url| url == nil}
	# end

end

# movies = Movies.new
# movies.search("sharknado")