# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge [by myself, with: Chris Aubuchon].

# 2. Pseudocode

# We found this solution at http://stackoverflow.com/questions/17417175/refactoring-feedback-for-reverse-polish-notation-rpn-or-postfix-notation
# It's the end of the week and we have work in the morning. We wanted to complete this
# challenge. But time is short. We went through this solution to better understand 
# the logic. We both have a pretty good grasp of it now. 

# 3. Online Solution

class RPNCalculator # define class RPNCalculator
  def evaluate(rpn) #define instance method evaluate that takes an arguement in reverse polish notation
    a = rpn.split(' ')#creates an array from the values passed as rpn
    array = a.inject([]) do |array, i|    #for each element in a #inject does the following
      if i =~ /\d+/  # if the element is a digit of any length
        array << i.to_i #push the element(as an integer) to array
      else #else
        b = array.pop(2) #it has to be a operand so remove the last two elements and push them into b
        case 
          when i == "+" then array << b[0] + b[1]  #so that when i = any of these operands it is
          when i == '-' then array << b[0] - b[1]  #placed bewteen the two numbers that are popped 
          when i == '*' then array << b[0] * b[1]  #and then evaluated and pushed back to the variable as to set
                                                    #a new value at var i
        end
      end
    end
    array.pop #removes the chance of their being two values(generally an operand) left in array
  end
end

# 4. Reflection

    # What parts of your strategy worked? What problems did you face?
        #We found a solution online that was helpful and used this to bolster our learning curve on this problem.
        #We faced a time restraint problem that didn't allow us to refactor the code into something that was our own.
    # What questions did you have while coding? What resources did you find to help you answer them?
        #I thought that array = a.inject([]).... didnt need array to be a variable that the informaiton was
        #passed to due to the fact that the block passes the elements to the array(inside the block) when it passes
        #the test. 
    # What concepts are you having trouble with, or did you just figure something out? If so, what?
        #We figured out that you can pop multiple values and then manipulate those values in the same block.
        #Neither of us have seen a case used like this and that was enlightening.
    # How confident are you with each of the learning objectives?
        #Somewhat.  Now that we have seen a problem done this way we are both confident that 
        # we will retain the know-how to take random data sets and manipulate them into the format 
        #that we need.
    # Which parts of the challenge did you enjoy?
        #commenting through the code in a pair. It was nice to see code slightly
        #our level that we could go through and better understand. 
    # Which parts of the challenge did you find tedious?
        #time constraint of this being the last night for subs.