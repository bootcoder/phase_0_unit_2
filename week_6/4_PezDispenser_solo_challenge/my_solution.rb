# U2.W6: PezDispenser Class from User Stories


#refactor
#reflect
#driver
#pseudo

# I worked on this challenge [by myself, with: ].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
# 
# *Initial Pseudo*
# 
# make a class PezDispenser that takes a single flavor array
# initialize 
# pez_contents = passed in flavor array
# pez_count = length of contents
# attr
# make a function to see all the pez
# make a function to add a pez that takes a pez argument
# make a function to count the pez
# make a function to take a pez in the correct order
# 


# CLASS PezDispenser (single array argument)
# 	FUNCTION initialize
# 		



# 3. Initial Solution

# class PezDispenser

# 	attr_accessor :pez_contents
# 	attr_accessor :pez_count

# 	def initialize(starting_pez)
#  		@pez_contents = starting_pez
#  		@pez_count = @pez_contents.length
#  	end

 	
# 	def see_all_pez
# 		@pez_contents.each_with_index { |pez, index| "#{index}:#{pez}" }
# 	end

# 	def add_pez(pez)
# 		@pez_count += 1
# 		@pez_contents << pez
# 	end

# 	def get_pez
# 		@pez_count -= 1
# 		@pez_contents.pop()
# 	end

# end
 


# 4. Refactored Solution

class PezDispenser

	attr_accessor :pez_contents

	def initialize(starting_pez)
 		@pez_contents = starting_pez
 	end

	def pez_count
		@pez_count = @pez_contents.length
	end
 	
	def see_all_pez
		puts "In order of placement"
		@pez_contents.each_with_index { |pez, index| puts "#{index+1}: #{pez}" }
	end

	def add_pez(pez)
		return "Woe there partner. Your Pez dispenser will only hold 12 pieces." if @pez_count == 12
		@pez_contents << pez
	end

	def get_pez
		return puts "Your out of Pez! Add some more please." if @pez_contents.empty?
		@pez_contents.pop()
	end

end
 




# 1. DRIVER TESTS GO BELOW THIS LINE

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
super_mario.see_all_pez
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"


def assert
	raise "Dammit Jim I'm a Doctor!" unless yield
end


assert { super_mario.class == PezDispenser }
assert { super_mario.see_all_pez.class == Array }
assert { super_mario.pez_count == flavors.length }
assert { PezDispenser.instance_method(:initialize).arity == 1}
assert { PezDispenser.instance_method(:add_pez).arity == 1}

# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# 
# Strategy for this challenge was to create a class and sub functions to mimic a PezDispenser. 
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# why cant i just recall pez count instead of having to increment it.
# 
# answer because I initially set count in initialize function recalling it calls the same value. 
# giving pez_count it's own function solves this problem
# 
# 
# why when I call see pez over the iterated array does it return both the iterated and un-iterated version...
# 
# answer: because the see_all was called with a puts statement it doubled the output of my see_all function. 
# removing the puts from the call in the driver code solved 
# 
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# 
# I guess my biggest problem right now is thinking of what things I want to test. 
# So far I've just been testing the sturctural functionality of the programs. Not what they really do
# Hoping to expand upon this next week. 
# 
# Did you learn any new skills or tricks?
# 
# Solo challenge so,, had to use what was floating around upstairs
# 
# How confident are you with each of the Learning Competencies?
# 
# Pretty confident.
# 
# Which parts of the challenge did you enjoy?
# 
# Updated after review.
# Well either I misunderstood the instructions or I am the only one that knows how a pez dispenser works. 
# Looks like everyone used a .shift to get_pez instead of a .pop 
# Shift takes from the beginning of the array where as pop takes from the end. 
# If the last pez you added goes to the back of the array then the next pez you take should be that pez
# 
# Which parts of the challenge did you find tedious?
# 
# None, was a non tedious challenge IMHO

