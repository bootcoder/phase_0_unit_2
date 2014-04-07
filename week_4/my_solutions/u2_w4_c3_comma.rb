#Solo challenge

# Initial PSEUDO
# 
# convert to string
# call length
# set up if loop that uses insert to place comma for various cases of length.... or maybe use a case statement.... IDK
# or a call that uses the length * 3 to find the location of placement and places thur <= length
#
# *REFACTORED PESUDO*
# 
# FUNCTION seperate_comma
	# define a function, seperate_comma which takes a single argument(num).
	# create a variable num_string and set it to num to string.
	# create a variable counter and set it equal to num_string's length
	# return the num_string if the initial value of counter is 3 or less
	# WHILE LOOP
	# 	while counter is greater than 0
	# 	IF modulus of counter three equals 0
	# 	call the insert method on num_string set it to act upon counter minus 2 and insert a comma.
	# 	increment the counter by -1
	# END WHILE LOOP
# END FUNCTION


# Initial Code

def separate_comma(num)
	num_string = num.to_s
	i = num_string.length
	# puts i
	# puts num_string
	return num_string if i <= 3
	while i > 0 do #i=5
			num_string.insert((0-(i+1)),",") if i % 3 == 0
			num_string.delete num_string[0] if num.to_s.length == 6
			i-=1
	end
	num_string.slice!(0) if num_string[0].include? ","
	# puts num_string
	num_string
end

# Refactored Code

def separate_comma(num)
	num_string = num.to_s
	num_length = num_string.length
	
	return num_string if num_length <= 3
	
	while num_length > 0 do
		num_string.insert(0-(num_length+1),",") if num_length % 3 == 0
		num_length-=1
	end
	
	num_string.slice!(0) if num_string[0].include? ","
	num_string
end

# Calling code

# separate_comma(0)
# separate_comma(100)
# separate_comma(1000)
# separate_comma(10000)
# separate_comma(100000)
# separate_comma(1000000)
# separate_comma(10000000)
# separate_comma(100000000)
# separate_comma(1000000000)
# separate_comma(10000000000)
# separate_comma(100000000000)
# separate_comma(1000000000000)

# # Driver Code
# # 
# p separate_comma(0) == "0"
# p separate_comma(100) == "100"
# p separate_comma(1000) == "1,000"
# p separate_comma(10000) == "10,000"
# p separate_comma(1000000000000) == "1,000,000,000,000"




#Reflections



# Definitely had a lot of trouble with the refining of this challenge
# Got it working pretty easily for certain numbers but realized that it did not return as expected with certain lengths
# the problem was that I was adding my comma's from left to right instead of right to left. I fixed this eventually 
# but then ran into a problem where I was adding a leading comma to lengths of 6,9,12, ect. 
# resolved this by slicing out the comma if it was the first character. now all is right in the world once again. 


