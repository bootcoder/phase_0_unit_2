# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode

# create a class BoggleBoard
# port in methods from previous challenge
# change variable names as needed
# 

# 3. Initial Solution
class BoggleBoard
	
	attr_accessor :board
	
	def initialize(board)
		@board = board
	end

	 
	def create_word(*coords)
		coords.map { |coord| @board[coord.first][coord.last]}.join("")
	end

	

	def get_row(row)
		@board[row]
	end  

	def get_col(col)
		col_array = []
		@board.length.times do |row|
			col_array << @board[row][col]
			row+=1
		end
		col_array
	end

	def get_all
		count = 0
		while count < @board.length do
			puts "Row #{count}: #{get_col(count)} Col #{count}: #{get_row(count)}"	
			count += 1
		end
	end

	#bonus
	
	def get_diagonal(x,y)
		# will come back if I can but it's been a rough week 
	end


 
end
 
 
# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:



dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 


boggle_board = BoggleBoard.new(dice_grid)

def assert
	raise "ERROR: Bad Boggle Juju!" unless yield
end

assert { boggle_board.class == BoggleBoard }
assert { boggle_board.board.class == Array }

assert { BoggleBoard.instance_method(:get_row).arity == 1}
assert { BoggleBoard.instance_method(:get_col).arity == 1}

assert { boggle_board.create_word([1,2],[1,1],[2,1],[3,2]) == "dock" }
assert { boggle_board.create_word([0,1],[0,2],[3,2],[0,3],[1,2]) == "raked" }
assert { boggle_board.create_word([3,0],[3,1],[3,2],[3,3]) == "take" }

assert { boggle_board.get_row(2) == ["e","c","l","r"] }
assert { boggle_board.get_col(2) == ["a","d","l","k"] }

assert { boggle_board.create_word([3,2]) == "k" }

assert { boggle_board.get_col(1)}

boggle_board.get_all

assert { BoggleBoard.instance_method(:get_diagonal).arity == 2 }


# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# 
# Straight forward, just port over the methods from the boggle solution and place them inside a class
# had to switch out a few variable names and set an attr accessor. No real problems here
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# n/a
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# 
# Not really having trouble with anything in particular here. 
# 
# Did you learn any new skills or tricks?
# 
# Not here sorry
# 
# How confident are you with each of the Learning Competencies?
# 
# Very Confident
# 
# Which parts of the challenge did you enjoy?
# 
# Seeing how easy it can be to switch from one program structure to another was nice.
# 
# Which parts of the challenge did you find tedious?
# 
# N/A
