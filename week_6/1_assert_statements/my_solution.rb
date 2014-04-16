# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself, with: ].


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
# assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs
# 
# FUNCTION assert
# 	define a function assert which takes no arguments
# 	raise an error string unless the yield is true, yield in is the product of the passed in driver code
# END FUNCTION
# 
# create a variable name and set it equal to bettysue
# CALL assert function with a comparison block between name and betty sue
# CALL assert function with a comparison block between name and billy bob
# 



# 3. Copy your selected challenge here


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

# Original Driver Code

# card = CreditCard.new(4408041234567893)

# p card.check_card == true

# card = CreditCard.new(4408041234567892)

# p card.check_card == false

# p card = CreditCard.new(440804123456789313) == ArgumentError
# p card = CreditCard.new(44080412345678) == ArgumentError





# 4. Convert your driver test code from that challenge into Assert Statements


p assert { card = CreditCard.new(4408041234567893)
					 card.check_card == true }

p assert { card = CreditCard.new(4408041234567892)
				 	 card.check_card == false}



# 5. Reflection
# 
# What parts of your strategy worked? What problems did you face?
# 
# No real strategy here. Just bang out a couple asserts and move along. Biggest problem faced
# was coming to grips with the names billybob and bettysue.....
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# Question would be why we arn't rushing more headlong into Rspec/TDD. I know it's coming
# and this is all great ground work, but I feel like this area of phase 0 could be accelerated.
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# 
# ...
# 
# Did you learn any new skills or tricks?
# 
# I can create classes from within asserts. I guess thats new.
# 
# How confident are you with each of the Learning Competencies?
# 
# Very Confident
# 
# Which parts of the challenge did you enjoy?
# 
# All, nice easy break into the week for me (on Wednesday ARRRG:'+)
# 
# Which parts of the challenge did you find tedious?
# 
# None Challenge was not tedious at all. 
