# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: The input is an INT that represents our secret number
# Output: The output are symbols :high, :low, :correct or a boolean for the solved? method
# Steps:
# 
# *PSEUDO*
# 
# CLASS GuessingGame
# 
# 	FUNCTION initialize
# 		create a function initialize which takes a single argument
# 		set instance variable @answer to the argument
# 		set instance variable @solved to false
# 	END FUNCTION
# 	
# 	FUNCTION guess
# 		create a function which takes a single argument and returns :high, :low, or :correct based on == @answer
# 		function should also modify the @solved variable accordingly
# 		IF STATEMENT
# 			assign @solved to false and return :low if guess is less than @answer
# 			assign @solved to false and return :high if guess is greater than @answer
# 			assign @solved to true and return :correct if guess equals @answer
# 		END IF
# 	END FUNCTION
# 	
# 	FUNCTION solved?
# 		create a function solved? which takes no arguments
# 		return @solved
# 	END FUNCTION
# 	
# END CLASS




# 3. Initial Solution

# class GuessingGame
#   def initialize(answer)
#     @answer = answer
#     @solved = false
#     @guess = 0
#   end

#   def guess(guess)
#   	@guess = guess
#   	@solved = false
#   	# puts "Guess = #{guess}"
#   	# puts "@Guess = #{@guess}"
#   	# puts "Answer = #{@answer}"
#   	# puts "."
#   	if @guess < @answer
#   		@solved = false
#   		:low
#   	elsif @guess > @answer
#   		@solved = false
#   		:high
#   	elsif @guess == @answer
#   		@solved = true
#   		:correct
#   	end
  		
# 		# :high if @guess > @answer
# 		# :low if @guess < @answer
# 		# @solved = true if @guess == @answer
# 		# :correct if @guess == @answer

#   end

#   def solved?
#   	@solved
#   end

# end




# 4. Refactored Solution

class GuessingGame

  def initialize(answer)
    @answer = answer
    @solved = false
  end

  def guess(guess)
  	@solved = false
  	if guess < @answer
  		:low
  	elsif guess > @answer
  		:high
  	elsif guess == @answer
  		@solved = true
  		:correct
  	end
  end

  def solved?
  	@solved
  end

end




# 1. DRIVER TESTS GO BELOW THIS LINE

game = GuessingGame.new(10)

p game.solved? == false
p game.guess(9) == :low
p game.solved? == false
p game.guess(11) == :high
p game.solved? == false
p game.guess(10) == :correct
p game.solved? == true



# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# Well there wasn't much logic here so that part was easy. Really the strategy was just to use
# what I've learned about class methods to put all the pieces in the right spot.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# On lines 69-72 I have where I originally tried to use in-line if statements to get this done. 
# These return nil... IDK why
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# I'm a little fuzzy on which variables need to go within the initialize call. I had @guess in there to start
# but removed it during refactoring without incident
# 
# Did you learn any new skills or tricks?
# No, but I'm feeling a lot better about manipulating variables and scope across functions
# 
# How confident are you with each of the learning objectives?
# The learning objectives state to get comfortable with string methods while loops and each methods. 
# While I am comfortable with these I do not see any possible use for them here.
# 
# Which parts of the challenge did you enjoy?
# SOLO Challenge baby, YEAH! Always feels good to bang this thing out. 
# 
# Which parts of the challenge did you find tedious?
# Still not saying Phase 0 is easy by any stretch, but I thought it would be harder. 
# I know the day is coming (I keep expecting it to be today), where I look at my challenge with 
# a galactic WTF. I hope that these easier challenges prepare me for that eventuality, so that I 
# do not look upon the mountain as an unreachable feat. Of course if you had asked me in January 
# how to do class work in Ruby I would have thought that was pretty lofty soooooo...

