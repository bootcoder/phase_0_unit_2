# U2.W4: Cipher Challenge


# I worked on this challenge [by myself, with: Chris Aubuchon].



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.



# def north_korean_cipher(coded_message)
#   input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
#   decoded_sentence = []
#   cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
#             "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
#             "g" => "c", 
#             "h" => "d", 
#             "i" => "e", 
#             "j" => "f",
#             "k" => "g",
#             "l" => "h",
#             "m" => "i",
#             "n" => "j",
#             "o" => "k",
#             "p" => "l",
#             "q" => "m",
#             "r" => "n",
#             "s" => "o",
#             "t" => "p",
#             "u" => "q",
#             "v" => "r",
#             "w" => "s",
#             "x" => "t",
#             "y" => "u",
#             "z" => "v",
#             "a" => "w",
#             "b" => "x",
#             "c" => "y",
#             "d" => "z"}
            
#   input.each do |x| # What is #each doing here?
#     found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
#     cipher.each_key do |y| # What is #each_key doing here?
#       if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
#         # puts "I am comparing x and y. X is #{x} and Y is #{y}."
#         decoded_sentence << cipher[y]
#         found_match = true
#         break  # Why is it breaking here?
#       elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
#         decoded_sentence << " "
#         found_match = true
#         break
#       elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
#         decoded_sentence << x
#         found_match = true
#         break
#       end 
#     end
#     if not found_match  # What is this looking for?
#       decoded_sentence << x
#     end
#   end
#   decoded_sentence = decoded_sentence.join("")
 
#   if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
#     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
#   end  
#   return decoded_sentence # What is this returning?        
# end

# Your Refactored Solution

def north_korean_cipher(coded_sentence)
  input = coded_sentence.downcase.split("") # takes the input and splits each letter into its own string. Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = [] #blank array 
  alphabet = ('a'..'z').to_a
  alphabet_cipher = Hash[alphabet.zip(alphabet.rotate(-4))]
  alt_cipher =  {"@" => " ", "#" => " ", "$" => " ", "%" => " ", "^" => " ", "&" => " ", "*" => " "}
  cipher = alphabet_cipher.merge(alt_cipher)
            
  input.each do |x| # iterating through each character of the coded mesage. What is #each doing here?
    found_match = false  # if statement outside of cipher key wont run. Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # looks at each key and compares to value. What is #each_key doing here?
      if x == y # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        decoded_sentence << cipher[y]
        found_match = true
      end 
    end
    if !found_match  # This is looking for leftovers. Which happen to  be ints within string. What is this looking for?
      decoded_sentence << x
    end
  end

  decoded_sentence = decoded_sentence.join("").capitalize #takes the array of single character strings and puts them together.
  decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  decoded_sentence # This returns the final decoded sentence. What is this returning? 

end



# Driver Code:

p north_korean_cipher("m^aerx%e&gsoi!") == "I want a coke!" #This is driver code and should print true
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "Our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "Our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "If you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "Next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "Can somebody just get me 100 bags of cool ranch doritos?"

# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"

p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")

# Reflection



# What parts of your strategy worked? What problems did you face?
# The strategy was to clean up the original solution as much as possible. I feel we did a great job at that.
# Problems included: how to eliminate long hand cipher generation (thanks challenge 5!),
# and what this does:
# 
# elsif (0..9).to_a.include?(x) 
# 
# I thought this line was to look for ints and push them to the decoded sentence.
# But after commenting out this portion of code I found the program ran unchanged...
# Furthermore I found that if i then commented out the following !found_match code
# that the program breaks, leaving me to conclude that the above statement does not act as expected at all.
# Further explanation would be greatly appreciated.
# 
# What questions did you have while coding? What resources did you find to help you answer them?
# unanswered question 
# how to change a strings characters value by a given amount. 
# i.e. a becomes b, b becomes c. I know it's possible but I don't know how to get there from here.
# 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# concepts are all there. once again though my biggest problem is putting it all together and getting the
# ball rolling. I still feel like I do a much better job once the basic structure has been laid. 
# And I feel very weak when it comes to making decisions about how best to start a given challenge. 
# ALSO, I feel very weak when it comes to array's and hashes. The basics I get but how they work and why
# they work in more complicated forms escapes me. I found a couple good pages explaining ruby collections 
# that I hope will set me straight.
# 
# Did you learn any new skills or tricks?
# .merge
# .rotate
# .zip (work in progress)
# 
# How confident are you with each of the learning objectives?
# Very confident
# 
# Which parts of the challenge did you enjoy?
# Working with Chris was nice. Once again, I'm hoping my entire coding career can be pair oriented. 
# It just feels so (opposite of hopelessly banging your head against the wall) just by having someone to talk to
# as I work through a problem. Most likely this is due to the vast amount of time I've spent coding alone over the
# last year....Now that I can pair. I find myself with code pair separation anxiety..... :+)
# 
# Which parts of the challenge did you find tedious?
# I would love to eliminate that whole found_match part but don't yet understand the steps needed to get around it.


