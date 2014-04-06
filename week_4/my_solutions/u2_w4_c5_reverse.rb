# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself, with: ].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

#define method with 1 argument
def translate_to_cipher(sentence)
    #creates an array containing a-z
    alphabet = ('a'..'z').to_a
    #creates cipher mechanism. This makes a new hash that contains the 
    #alphabet with the original values as keys and the rotated values as values
    #rotate changes the index location of an array by the given amount using around the world logic.
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
    #spaces defines an array that contains cipher chars denoting a space
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    # creates a var from the input that is down-cased
    original_sentence = sentence.downcase
    # creates an empty array we can push encoded elements to
    encoded_sentence = []
    # iterates through original_setence looking at each character
    # each_char is like array each but for strings
    original_sentence.each_char do |element|
      # if the cipher includes the passed character it is added to the encoded sentence
      if cipher.include?(element)
        encoded_sentence << cipher[element]
      # if the element is a space a random element from the spaces array is pushed to the encoded sentence
      elsif element == ' '
        encoded_sentence << spaces.sample
      # this cleans up and pushes the leftovers which I presume to be ints and punctuation.
      else 
        encoded_sentence << element
      end
     end
    # returns the completed encoded sentence
    return encoded_sentence.join
end


# Questions:
# 1. What is the .to_a method doing?
# to_a takes the input and if possible converts it to an array
# 
# 2. How does the rotate method work? What does it work on?
# rotate works on arrays by changing the elements index location by the given value.
# This works around the world style so rotate(1) will bring z to index 0 and a to index 1
# 
# 3. What is `each_char` doing?
# each_char is the string equivalent of array#each. 
# It iterates through the given string and runs the block given
# 
# 4. What does `sample` do?
# sample is an array method that returns a random element from a given array
# 
# 5. Are there any other methods you want to understand better?
# Zip, I've looked around and I guess I get what it does. When I played with it in PRY I took
# a single alphabet array and when I zipped it I got back a 2d array with each element being its 
# own array. Not 100% sure why I need this. Will look into a bit more when time permits.
# 
# 6. Does this code look better or worse than your re-factored solution
#    of the original cipher code? What's better? What's worse?
# Overall I'd say slightly better. Because its a tad cleaner. The algorithm for making the cipher is far superior 
# to the long form hash method
# 
# 7. Is this good code? What makes it good? What makes it bad?
# Oh boy, at this point it's all still code to me. I recognize horrible code just fine, but the 
# subtleties between good code and OK code are escaping me thus far


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
# No each time it runs different spacing characters are passed through because we used the sample method
# 
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")






# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# The strategy for this challenge was to follow the instructions, comment as necessary and answer the provided ?'s
# I'd say it worked out fairly well...
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# How does zip work? So far I conclude that zip is a way of concatenating arrays but in non-standard order
# more insight is needed as to the why in this equation...
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# ...
# 
# Did you learn any new skills or tricks?
# Easy ways to create alphabet and number arrays for iteration
# 
# How confident are you with each of the learning objectives?
# very confident with the first two, determining best practices code will take some practice.
# 
# Which parts of the challenge did you enjoy?
# ...
# 
# Which parts of the challenge did you find tedious?
# Gonna go out on a limb here and say the mandatory reflections should not always be so mandatory.
# I get that we're foundation building here so I understand. Just pointing out that I feel I reflected
# what needed to be said whilst answering the challenge questions provided.
