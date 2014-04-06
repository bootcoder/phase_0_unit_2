#u2_w4_c2_cheater.rb

# U2.W4: HomeWork Cheater


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: The input is an array that contains various specifics for completing the essay
# Output: The output is a string that is a short canned essay
# Steps:
# 
#  *Initial PSEUDO*
#  function essay_writer
#   IF LOOP 
#   	if pronoun == male set pronoun variables to male
#   	== female set pronoun variables to female
#   END IF
#   use puts with interpolation to complete an essay paragraph


# 3. Initial Solution

def essay_writer(title, full_name, year, contribution_sentence, pronoun)
	
	name = full_name.split(" ")
	first_name = name[0]
	last_name = name[1]

	if pronoun == "male"
		he_she = "he"
		him_her = "him"
		his_hers = "his"
	elsif pronoun == "female"
		he_she = "she"
		him_her = "her"
		his_hers = "hers"
	end

	canned_essay = "\n#{title}\n
		#{full_name} was a central figure in #{year}. #{he_she.capitalize} accomplished a lot.\n
		It was fun learning more about #{him_her}. #{contribution_sentence}\n
		#{last_name}'s contribution's go farther than that though, and I look forward to\n
		learning more about #{him_her}. After this brief study I can surly say that\n
		#{his_hers} was a most interesting life indeed.\n"

	puts canned_essay
end


# 4. Refactored Solution

def essay_writer(title, full_name, year, contribution_sentence, pronoun)
	
	name = full_name.split(" ")
	last_name = name[1]

	if pronoun == "male"
		he_she = "he"
		him_her = "him"
		his_hers = "his"
	elsif pronoun == "female"
		he_she = "she"
		him_her = "her"
		his_hers = "hers"
	end

	canned_essay = "\n#{title}\n
		#{full_name} was a central figure in #{year}. #{he_she.capitalize} accomplished a lot.\n
		It was fun learning more about #{him_her}. #{contribution_sentence}\n
		#{last_name}'s contribution's go farther than that though, and I look forward to\n
		learning more about #{him_her}. After this brief study I can surly say that\n
		#{his_hers} was a most interesting life indeed.\n"

	puts canned_essay
end






# 1. DRIVER TESTS GO BELOW THIS LINE

essay_writer("The life and times of a modern movie masterpiece.", "Brendon Frazier", 1996, "Frazier's major contribution was that half way decent film with Elizabeth Hurley.", "male") 
# =>"The life and times of a modern movie masterpiece.

		# Brendon Frazier was a central figure in 1996. He accomplished a lot.

		# It was fun learning more about him. Frazier's major contribution was that half way decent film with Elizabeth Hurley.

		# Frazier's contribution's go farther than that though, and I look forward to

		# learning more about him. After this brief study I can surly say that

		# his was a most interesting life indeed."

essay_writer("Ohh my Oprah", "Oprah Winfrey", 2001, "Oprah's major contribution was that interview with Tom Cruise that went totally viral, thus coining the phrase 'viral'.", "female")
# => "Ohh my Oprah

		# Oprah Winfrey was a central figure in 2001. She accomplished a lot.

		# It was fun learning more about her. Oprah's major contribution was that interview with Tom Cruise that went totally viral, thus coining the phrase 'viral'.

		# Winfrey's contribution's go farther than that though, and I look forward to

		# learning more about her. After this brief study I can surly say that

		# hers was a most interesting life indeed."


# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# The strategy here was the simplest of this weeks challenges. Aside from the pronoun usage this
# challenge is pretty much straight string interpolation.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# Biggest ? I had was what to call my variables. I had to go back and look at
# some grammar references. Subject, possessive, object... Eventually I decided on the more literal split names used
# above, because I thought them to be easier for the reader to understand.
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# ...
# 
# Did you learn any new skills or tricks?
# ...
# 
# How confident are you with each of the learning objectives?
# Very comfortable mostly. The only rub I might say is the last objective. produce destructive vs: non-destructive methods
# Only reason I say that is because I don't see the need in this exercise. I must be missing something...
# 
# Which parts of the challenge did you enjoy?
# More coding == better me. That's always a good feeling.
# 
# Which parts of the challenge did you find tedious?
# ...




