# U2.W4: Create Groups


# I worked on this challenge [by myself, with: Dominick Odo && W. Butler Bushyhead].

# 2. Pseudocode

# Input: The input is an array of names
# Output: The output is a 2d array of names in groups.
# Steps:

# PSEUDO
# create a function "create_groups" which accepts a single array as its argument.
# split the array into strings containing first and last names. 
# divide total names by 4 to get how many groups you need. 
# slice name array by groups needed



# 3. Initial Solution

fence_lizards = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", 
"Andra Lally", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff",
"Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino", "Eoin McMillan", 
"Hunter T Chapman", "Jacob Persing", "Jon Pabico", "Parjam Davoody", "Samuel Davis", 
"Sebastian Belmar", "Shawn Seibert", "William Butler Bushyhead", "Yuzu Saijo", 
"Christiane Kammerl"]

def create_groups(input)
  input.sort!
  unit_groups = []
  3.times { |n|
	unit_groups = input.shuffle(random: Random.new(n)).each_slice(4).to_a
	}
	puts "Group 1 is #{unit_groups[0]}"
	puts "Group 2 is #{unit_groups[1]}"
	puts "Group 3 is #{unit_groups[2]}"
	puts "Group 4 is #{unit_groups[3]}"
	puts "Group 5 is #{unit_groups[4]}"
	puts "Group 6 is #{unit_groups[5]}"
	unit_groups
end

# 4. Refactored Solution

def create_groups(input)
  input.sort!
  unit_groups = []
  3.times { |n|
	unit_groups = input.shuffle(random: Random.new(n)).each_slice(4).to_a
	}
	unit_groups
end


# Refactored Group Solution
# Thanks to Butler Bushyhead for guiding us

def get_groups(array)
	master_array = []
	3.times do 
		split_array = array.shuffle.each_slice(4).to_a
		if array.length % 4 != 0
		leftovers = split_array.pop
		end
		split_array[0].push(leftovers[0])
		split_array[1].push(leftovers[0]) unless leftovers.empty? == true
		split_array[2].push(leftovers[0]) unless leftovers.empty? == true
		master_array.push(split_array)
	end
	print "Unit 1 groups are " + master_array[0].to_s
	puts " "
	print "Unit 2 groups are " + master_array[1].to_s
	puts " "
	print "Unit 3 groups are " + master_array[2].to_s

	master_array
end





# 1. DRIVER TESTS GO BELOW THIS LINE


# bit over zealous I suppose 
# I wrote the driver code in RSPEC format located in 
# u2_w4_c1_groups_spec.rb
# 
# # test 1 
# should be a function

# test 2
# should be passed a single array

# test 3
# should return 2d array with group members inside.

# RSPEC

# require_relative "u2_w4_c1_groups"

# describe 'create_groups' do
# 	let!(:fence_lizards) { ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff", "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino", "Eoin McMillan", "Hunter T Chapman", "Jacob Persing", "Jon Pabico", "Parjam Davoody", "Samuel Davis", "Sebastian Belmar", "Shawn Seibert", "William Butler Bushyhead", "Yuzu Saijo", "Christiane Kammerl"] }
# 	it "is defined" do
# 		defined?(create_groups).should eq "method"
# 	end

# 	it "requires a single argument" do
# 		method(:create_groups).arity.should eq 1
# 	end

# 	it "returns the correct 2D array" do
# 		create_groups(fence_lizards).should eq [["Sebastian Belmar", "Eiko Seino", "Eoin McMillan", "Aki Suzuki"], ["William Butler Bushyhead", "Jacob Persing", "Jon Pabico", "Shawn Seibert"], ["Christiane Kammerl", "Dominick Oddo", "Anup Pradhan", "Adam Ryssdal"], ["Parjam Davoody", "Samuel Davis", "Hunter T Chapman", "Andra Lally"], ["Yuzu Saijo", "Allison Wong", "CJ Jameson", "Christopher Aubuchon"], ["Clark Hinchcliff", "Dong Kevin Kang", "Adam Dziuk", "Devin A Johnson"]]
# 	end

# end


# 5. Reflection 



# What parts of your strategy worked? What problems did you face?
# I went with the slice method in my original strategy. Once we got into a group for this challenge 
# it became obvious pretty quick that that was a good choice as the other two memebers also choose slice.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# How to create an array with first and last names as single elements
# 
# why, when I create an array using %w does that array not respond to .split(no method error) 
# but when I call .to_s first it works just fine(except that it totally screws up my data formatting)
# eventually I just created the array long hand to get it to go how I wanted. 
# Still would like to know a good way to use %w 

# full_names = %w[Adam Dziuk, Adam Ryssdal, Aki Suzuki, Allison Wong, Andra Lally, Andrew McDonald, Anup Pradhan, CJ Jameson, Christopher Aubuchon, Clark Hinchcliff, Devin Johnson, Dominick Oddo, Dong Kevin Kang, Eiko Seino, Eoin McMillan, Eric Wehrli, Hunter Chapman, Jacob Persing, Jon Pabico, Mary Huerster, Parjam Davoody, Samuel Davis, Sebastian Belmar, Shawn Seibert, W. Butler Bushyhead, Yuzu Saijo, Christiane Kammerl]
# vs:
# fence_lizards = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", "Clark Hinchcliff", "Devin A Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino", "Eoin McMillan", "Hunter T Chapman", "Jacob Persing", "Jon Pabico", "Parjam Davoody", "Samuel Davis", "Sebastian Belmar", "Shawn Seibert", "William Butler Bushyhead", "Yuzu Saijo", "Christiane Kammerl"]
# Had an AHA moment when I realized the %w was splitting by spaces not by comma's. 
# Don't yet know how best to get around this. I played with joining the array by space then splitting by comma using
# two different variables like so
# 
# names = full_names.join(" ")
# new_names = names.split(",")
# 
# it's not pretty but it works so....
#
#
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# see above.
# 
# Did you learn any new skills or tricks?
# not that I learned so much as I solidified. I knew about random and seeds b4 but, havn't used them
# since Learn ruby the hard way.
# 
# How confident are you with each of the learning objectives?
# Very confident
# 
# Which parts of the challenge did you enjoy?
# Really enjoyed our 3way group pair on this. Just some friends from unit 1 accountability hanging out talking code 
# and plugging away.
# 
# Which parts of the challenge did you find tedious?
# none

