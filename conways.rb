require "rspec"
require "pry"

class Cell

	attr_accessor :state, :neighbours

  def initialize(state)
    @state = state 
    @neighbours = [] 
  end

  def regenerate

    if  @state == 1 && @neighbours.reduce(:+) == (2..3)
    	@state = 1
    end

    if  @state == 0 && @neighbours.reduce(:+) == 3
    	@state = 1
    end

    if @state == 1 && @neighbours.reduce(:+) < 2
    	@state = 0
    end

    if @state == 1 && @neighbours.reduce(:+) > 3
    	@state = 0
    end

    @state 

   end


end

class Game

	attr_accessor :grid,:board,:width,:height

	def initialize(width,height)

		@width = width
		@height = height
		@grid = Array.new(width){Array.new(height){rand(2)}}
		@board = @grid.map do |row|
					row.map do |cell|
						cell = Cell.new(cell)
					end
				end
		cell_neighbours

	end

	def cell_neighbours

		line = 0
		@board.map do |row| 
			column = 0
			row.map do |cell|
				cell.neighbours = []
				if line > 0 && column >0 

					if @board[line-1][column-1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if line > 0 

					if @board[line-1][column].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end 
				end

				if line > 0 && column < (@height-1)

					if @board[line-1][column+1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if column > 0

					if @board[line][column-1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if column < (@height-1)

					if @board[line][column+1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if line < (@width-1) && column > 0 

					if @board[line+1][column-1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if line < (@width-1)

					if @board[line+1][column].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end

				if line < (@width-1) && column < (@height-1) 

					if @board[line+1][column+1].state == 1
						cell.neighbours << 1
					else 
						cell.neighbours << 0
					end
				end
				column += 1
			end
			line += 1
		end
	end

	def next_turn

		@board.map  do |line|
			line.map do |cell|
				cell.regenerate
			end
		end

		show

	end

	def show

		@board.each do |line|
			line.each do |cell|
				if cell.state == 1
				 	print "X"
				else
					print " "
				end
			end
			puts
		end

		player_choice
	end

	def player_choice

		puts "Continue?"
		answer = gets.chomp

		if answer == "y"
			cell_neighbours
			next_turn
		else
			puts "End!"
		end

	end

end

game = Game.new(100,100)
game.show


