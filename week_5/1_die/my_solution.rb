# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: This input is an Int that represents the number of sides to be created in the Die object.
# Output: The output varies depending on the function call. Sides outputs # of sides. Roll outputs a random side.
# Steps:

# *PSEUDO*
# 
# CLASS Die
	# FUNCTION initialize
	# create initialize function which takes 1 argument
		# IF LOOP
		# 	if sides are less than 1 raise error
		# 	if sides are greater than 1 set instance variable sides to the passed in value
		# END IF
	# END FUNCTION
	# 
	# FUNCTION sides
	# create a function sides which will return the sides of the object
	# return the instance variable @sides
	# END FUNCTION
	# 
	# FUNCTION roll
	# create a function roll which returns a random side when called.
	# use range from 1 through the number of sides, convert to an array and call sample method
	# END FUNCTION
	# 
# END CLASS


# 3. Initial Solution

class Die
  def initialize(sides)
  	if sides < 1 
  		raise ArgumentError
  	elsif sides >= 1
			@sides = sides
		end
  end
  
  def sides
    @sides
  end
  
  def roll
		(1..@sides).to_a.sample
  end
end



# 4. Refactored Solution

class Die
  def initialize(sides)
  	raise ArgumentError if sides < 1 
		@sides = sides if sides >= 1
  end
  
  def sides
    @sides
  end
  
  def roll
		(1..@sides).to_a.sample
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

die = Die.new(10)
possible_values = (1..die.sides).to_a
unique_rolls = Array.new(200) {die.roll}.uniq.sort
p die.sides == 10
p unique_rolls == possible_values





# 5. Reflection 
# 
# What parts of your strategy worked? What problems did you face?
# Everything worked as it should. The strategy here was to read the assigned reading and 
# bang out this challenge. I'd say it worked pretty well. :+)
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# I can't seem to find a way to translate RSPEC for Die(0) to working driver code. This is because the 
# class definition raises an ArgumentError when such an object is created. Therefore I cannot test it 
# as driver code without raising said error. I plan on asking my group about how to get around this.
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# These concepts I'm good with.
# 
# Did you learn any new skills or tricks?
# I did not know how to raise an error before. Now I do.
# 
# How confident are you with each of the learning objectives?
# Very Confident
# 
# Which parts of the challenge did you enjoy?
# Getting better all the time is what I enjoy.
# 
# Which parts of the challenge did you find tedious?
# driver code...wish we just dove straight into RSPEC...