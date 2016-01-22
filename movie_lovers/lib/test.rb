require "Imdb"

i = Imdb::Search.new("sharknado")
i = i.movies
puts i.length

puts Imdb::Movie.new(2724064).url