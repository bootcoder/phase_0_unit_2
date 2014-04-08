# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: The input is an array containing single character strings
#
# Output: The output is function dependent
# 				.sides returns the number of sides
# 				.die_char returns the characters contained on the die
# 				.roll returns a random character
# 
# Steps:
# 
# *PSEUDO*
# 
# Create a class for die. 
# This class should calculate the number of sides, characters contained, and a random result from a roll.
# 
# CLASS Die
# 
# 	FUNCTION initialize
# 		create a function initialize that takes a single argument
# 		raise error if length of argument is less than 1
# 		set instance variable @ sides to the argument
# 	END FUNCTION
# 	
# 	FUNCTION sides
# 		instance variable @sides length
# 	END FUNCTION
# 	
# 	FUNCTION die_char
# 		return instance variable @sides
# 	END FUNCTION
# 	
# 	FUNCTION roll
# 		return the instance variable @sides after calling the following methods 
# 		convert to an array, unique, sample
# 	END FUNCTION
# 	
# END CLASS


# 3. Initial Solution

# class Die
#   def initialize(sides)
#   	raise ArgumentError if sides.length < 1 
# 		@sides = sides if sides > 1
#   end
  
#   def sides
#     @sides.length
#   end
  
#   def roll
# 		@sides.to_a.uniq.sample
#   end
# end



# 4. Refactored Solution

class Die

  def initialize(sides)
  	raise ArgumentError.new("Put some strings in there silly goose!") if sides.length < 1 
		@sides = sides
  end
  
  def sides
    @sides.length
  end

  def die_char
  	@sides
  end
  
  def roll
		@sides.sample
  end

end


# 1. DRIVER TESTS GO BELOW THIS LINE

die_a = Die.new(['A'])
die = Die.new(['A','B','C','D','E','F','G','H','I','J','L','M'])
possible_outcomes = die.die_char
unique_rolls = Array.new(500) {die.roll}.uniq.sort

p die.sides == 12
p unique_rolls == possible_outcomes
p die_a.sides == 1
p die_a.roll == "A"






# 5. Reflection 
# 
# What parts of your strategy worked? What problems did you face?
# Same as challenge 1. No real issues here. I had some trouble passing the last test but
# figured it out pretty quickly. Also, I added another class method to define the characters of each side
# since the sides function now returns length and not content.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# ...
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# ...
# 
# Did you learn any new skills or tricks?
# ...
# 
# How confident are you with each of the learning objectives?
# Very Confident
# 
# Which parts of the challenge did you enjoy?
# Had to tinker with this one just a bit more. That's always nice
# 
# Which parts of the challenge did you find tedious?
# N/A
