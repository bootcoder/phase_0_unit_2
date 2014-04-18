# U2.W6: Drawer Debugger


# I worked on this challenge by myself.


# 2. Original Code

class Drawer

	attr_reader :contents

# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		if item.clean == false
			puts "Only clean items can be placed in the drawer."
		else
			puts "You placed a #{item.type} in the drawer."
			@contents << item
		end
	end

	def remove_item(item = @contents.pop) 
		# pop is taking the last item placed in the drawer 
		# and assigning it as the item to be passed in if item is not given as an argument.
		@contents.delete(item)
		item
	end

	def dump  # what should this method return?
		puts "Your drawer is now empty."
		@contents = []
	end

	def view_contents
		if @contents.empty?
			puts "The drawer has nothing in it."
		else
			puts "The drawer contains:"
			@contents.each {|silverware| puts "- " + silverware.type }
		end
	end
end


class Silverware

	attr_reader :type, :clean

# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = true
	end

	def eat
		puts "Eating with the #{type}"
		@clean = false
	end

	def clean_item
		@clean = true
		puts "Cleaning the #{type}."
		puts "The #{type} is now clean."
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_item

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents # This will return a string from view_contents with no contents listed.

fork = Silverware.new("fork")
silverware_drawer.add_item(fork)
silverware_drawer.view_contents 
fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
puts "eat"
fork.eat
print "clean? "
p fork.clean
puts "clean item"
#BONUS SECTION
fork.clean_item
print "clean? "
p fork.clean


# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed" unless yield 
end 

assert { fork.class == Silverware }
assert { silverware_drawer.class == Drawer }
assert { silverware_drawer.class != Silverware }
assert { silverware_drawer.dump.empty? == true}



# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# 
# The strategy here was to remove error bugs and tweak class structure to support provided driver code.
# Mostly that went pretty well. I did have a problem tracing out how the sharp knife went,
# but that was figured out.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# 
# none really :+)
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# 
# ...
# 
# Did you learn any new skills or tricks?
# 
# using p fork.clean to display a variable's value was new I guess. 
# 
# How confident are you with each of the Learning Competencies?
# 
# Very confident
# 
# Which parts of the challenge did you enjoy?
# 
# I like the process of reading errors and fixing them, I mean it's not the best thing in the world,
# but I don't find it tedious so that's good.
# 
# Which parts of the challenge did you find tedious?
#
# ... 


