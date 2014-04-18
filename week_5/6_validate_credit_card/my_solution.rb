# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: The input is a single argument containing a series of INT's
# 
# Output: The output is true or false
# 
# Steps:
# 	make a class subsequent functions to check for valid cc numbers
# 
# *PSEUDO*
# 
# CLASS CreditCard
#
# 
# 	FUNCTION initialize
	# 	create a function initialize which takes a single argument
	#		raise argument error if argument length is not equal to 16
	#		assign instance variable @num to the input argument
#		END FUNCTION
#		
#		FUNCTION check_card
#			create a function check_card which takes no arguments
#			this function will need to do the following
#			double all the even indexed values of the input
#			sum all elements of the input after doubling
#			doubled numbers greater than 9 should be summed as single digit numbers (ex 12 => 1+2 == 3)
#			
#			create a variable cc_num and set it equal to the instance variable @num to a string split with ""
#			create an empty array doubled
#			iterate through cc_cum using each_with_index, use 2 arguments 1 to represent value and 1 for index
#			IF LOOP
#				IF index is even
#				create variable value_x2 and set it equal to value to int * 2
#				convert value_x2 to a string 
#				push first element to doubled array as an int
#				push second element to doubled array as in int
#			ELSIF
#				index is odd
#				push value to doubled array
#			END IF
#			
#		#	Now add the values of the doubled array and check to see if the sum is evenly divisible by 10
#			
#			create a variable cc_sum and set it equal to doubled array reduced using clown face
#			
#			IF LOOP
#				IF cc_sum is evenly divisible by 10 return true
#				ELSE return false
#			END IF
#		END FUNCTION
#	END CLASS
#	
#	*/PSEUDO*


# 3. Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits
# class CreditCard
# 	def initialize(num)
# 		raise ArgumentError.new("Invalid CC Number") if num.to_s.length != 16
# 		@num = num
# 	end

# 	def check_card
# 		cc = @num.to_s.split("")
# 		print "Original cc: #{cc}"
# 		puts
# 		doubled = []
# 		#iterate through array by index modifying only the odd values.
# 		cc.each_with_index do |value, index|
# 			if index % 2 == 0
# 				# puts value
# 				value_x2 = value.to_i*2
# 				# puts "value_x2:#{value_x2}"
# 				value_string = value_x2.to_s
# 				# puts "value_string:#{value_string}"
# 				value_1 = value_string[0]
# 				value_2 = value_string[1]
# 				# puts "value_1:#{value_1}"
# 				value_i = value_1.to_i
# 				# puts "value_i:#{value_i}"
# 				doubled << value_i
# 				value_i = value_2.to_i
# 				doubled << value_i
# 			elsif index % 2 == 1
# 				doubled << value.to_i
# 			end
# 		end
# 		puts
# 		print doubled
# 		puts doubled.class

# 		cc_sum = doubled.reduce(:+)
# 		puts
# 		print cc_sum
# 		puts cc_sum.class
# 		if cc_sum % 10 == 0 
# 			true
# 		elsif cc_sum % 10 != 0
# 			false
# 		end
# 	end
# end



# 4. Refactored Solution

class CreditCard

	def initialize(num)
		raise ArgumentError.new("Invalid CC Number") if num.to_s.length != 16
		@num = num
	end

	def check_card
		cc = @num.to_s.split("")
		cc_doubles = []

		cc.each_with_index do |value, index|
			if index % 2 == 0
				value_x2 = value.to_i*2
				value_x2.to_s.split(//).each { |i| cc_doubles << i.to_i } 
			elsif index % 2 == 1
				cc_doubles << value.to_i
			end
		end

		cc_sum = cc_doubles.reduce(:+)

		return true if cc_sum % 10 == 0 
		false
	end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

card = CreditCard.new(4408041234567893)

p card.check_card == true

card = CreditCard.new(4408041234567892)

p card.check_card == false

# p card = CreditCard.new(440804123456789313) == ArgumentError
# p card = CreditCard.new(44080412345678) == ArgumentError






# 5. Reflection 


# What parts of your strategy worked? What problems did you face?
# 
# The initial strategy was a complete disaster for me. Due in large part to the fact that I glanced 
# over the algorithm for check_card and did not realize that it was adding double digit values 
# as single digits. I built everything out but could not for the life of me get the check_card to pass
# Filled up a whole sheet of paper doubling digits and summing them without getting expected result. 
# Then I decided to run through the math in the example one more time and BOOM! I'm an idiot :+)
# Thank FSM I figured it out when I did because I was just about to post for help in the group page...
# So I had to go back and start from scratch to account for the new math. This was difficult for me to do
# because the different things I wanted to do with the data all required different data structures to operate
# I used print .class statements to work through each step to get the correct data with the value and type
# needed. 
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# ARRR why can't I just split a fixnum, sum it and return it :'(
# I needed to convert data to different types throughout this function I found a quick reference for this 
# here: https://www.ruby-forum.com/topic/152714
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# 
# I need to further my understanding of data types in regards t what they can / can't do
# I know them but they aren't concrete and referencing constantly is going to get old.
# 
# Did you learn any new skills or tricks?
#  
# It took quite a bit of refatoring to get to this line. Has happy face, 7 lines of code to 1!
# Great to be able to string together multiple methods on one line
# 
# value_x2.to_s.split(//).each { |i| cc_doubles << i.to_i } 
# 
# # Original way to adding digits greater than 9
				# value_string = value_x2.to_s
				# value_1 = value_string[0]
				# value_2 = value_string[1]
				# value_i = value_1.to_i
				# cc_doubles << value_i
				# value_i = value_2.to_i
				# cc_doubles << value_i
#
# How confident are you with each of the learning objectives?
# 
# Fairly confident. Could use more practice with data types and iteration
# 
# Which parts of the challenge did you enjoy?
# 
# Running rspec . with the proper test code and seeing that little green line at the bottom!!
# Also I really like refactoring my code once I'm green. Fun for me to get it down as clean as possible
# 
# Which parts of the challenge did you find tedious?
# 
# writing out 10 lines of code for a function that I know can be done better. 
# having a green rspec and looking at my code thinking "Damn that's ugly"