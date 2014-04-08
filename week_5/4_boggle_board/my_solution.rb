# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [by myself, with: ].

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode

# Initial Solution

def create_word(board, *coords)
	coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
p create_word($boggle_board,[3,0],[3,1],[3,2],[3,3]) == "take"

# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

# Initial Solution
def get_row(row)
	$boggle_board[row]
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
p get_row(1) == ["i","o","d","t"]

# Reflection 
# 
# I learned that to call nested array you use array[x][y]


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode

# Initial Solution

# def get_col(col)
# 	col_array = []
# 	col_array << $boggle[0][col]
# 	col_array << $boggle[1][col]
# 	col_array << $boggle[2][col]
# 	col_array << $boggle[3][col]
# 	col_array
# end



# Refactored Solution

def get_col(col)
	col_array = []
	$boggle_board.length.times do |row|
		col_array << $boggle_board[row][col]
		row+=1
	end
	col_array
end

# DRIVER TESTS GO BELOW THIS LINE

p get_col(1) == ["r","o","c","a"]

# Reflection 

# What parts of your strategy worked? What problems did you face?
# This one took me about 45 minutes. First I had to figure out how to call nested elements
# then I came to the realization that the board was not accessible from within the functions because
# it is not an elevated variable. So I went ahead and made the board a global to take care of that.
# Still a bit iffy on scope, practice makes perfect... 
# If that whole global variable thing is wrong please let me know
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# For the get_col function I tried to use a while loop but kept getting 
# undefined method `[]' for nil:NilClass (NoMethodError)
# not sure why. switched over to .times and all was right
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# scope is still an issue for me, syntax without reference has aways to go also. 
# I did however figure out the syntax of how to call elements from a nested array so that was good
# 
# How confident are you with each of the learning objectives?
# Fairly comfortable. I can use some more practice with 
# how data structures and classes can model a real world object.
# 
# Which parts of the challenge did you enjoy?
# Being frustrated about stupid Nilclass
# taking a break
# coming back 15 minutes later, sitting down and going, ahhhhh
# that was nice
# 
# Which parts of the challenge did you find tedious?
# My lack of understanding in relation to scope and iteration was not so awesome.
# But alls well that ends well.
# Also I really would have thought that nested array calls would go more like
# array[[1],[1]] || array [1],[1]
# I don't yet understand why array[1][1] works but I know that it does and that's ok with me!

