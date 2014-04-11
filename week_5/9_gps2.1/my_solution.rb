# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1)Travis Hernandez
# 2)Hunter Chapman bootcoder@gmail.com

 # This is the file you should end up editing. 
 



# Initial Code with comments
# 
def bakery_num(num_of_people, fav_food) #function definition takes two args
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} #hash available foods
 # pie_qty = 0
  #cake_qty = 0
 # cookie_qty = 0
  
  has_fave = false

  my_list.each_key do |k| #iterate through the hash
    if k == fav_food #key is fav food
      has_fave = true # changes boolean for has fav
      fav_food = k # assigns fav food variable to hash key
    end
  end
  if has_fave == false #if statement for no fav food
    raise ArgumentError.new("You can't make that food") #raises error
  else
    fav_food_qty = my_list.values_at(fav_food)[0] #sets fav food quantity variable, it is assigned to value at fav food (value from my_list hash)
      if num_of_people % fav_food_qty == 0 #this takes number of people argument modulus fav food quant equals 0
        num_of_food = num_of_people / fav_food_qty #set num_food variable equal to num people / fav food quantity
        return "You need to make #{num_of_food} #{fav_food}(s)." # returns string quantity of food and which food
      else num_of_people % fav_food_qty != 0 #else if the number of people % fav quant != 0 run the while loop below
        while num_of_people > 0 # while number of people is > 0
          if num_of_people / my_list["pie"] > 0 # if the number of people divided 
          # by the hash value of pie > 0
            pie_qty = num_of_people / my_list["pie"] #sets pie quantity to the number 
            # of people divided by the hash value of pie.
            num_of_people = num_of_people % my_list["pie"]#set the number of people 
            # vairable to the number of people to the number of people % my_list hash value pie
          elsif num_of_people / my_list["cake"] > 0 # elsif the number of people divided by
          # my_list cake value is > 0 do
            cake_qty = num_of_people / my_list["cake"] #sets cake quantiy to the number of people divided by 
            #my-list hash value cake
            num_of_people = num_of_people % my_list["cake"] # sets number of people to 
            #number of people % value of my_hash cake
          else
            cookie_qty = num_of_people # sets cookie qty to num of people remaining
            num_of_people = 0 # sets number of people to 0
          end
        end
        # returns variables in string interpolation from above.
        return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  end
end




# Mess around revision.

def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  pie_qty = 0
  cake_qty = 0
  cookie_qty = 0
  
  has_fave = false

  my_list.each_key do |k| 
    if k == fav_food 
      has_fave = true 
    else
      raise ArgumentError.new("You can't make that food") 
    end
  
    fav_food_qty = my_list.values_at(fav_food) 
      if num_of_people % fav_food_qty == 0
        num_of_food = num_of_people / fav_food_qty 
        return "You need to make #{num_of_food} #{fav_food}(s)."
      else
        case fav_food
        when fav_food == "pie"

          while num_of_people > 0 
            if num_of_people / my_list["pie"] > 0
            pie_qty = num_of_people / my_list["pie"] 
            num_of_people = num_of_people % my_list["pie"]
          elsif num_of_people / my_list["cake"] > 0 
            cake_qty = num_of_people / my_list["cake"] 
            num_of_people = num_of_people % my_list["cake"] 
          else
            cookie_qty = num_of_people 
            num_of_people = 0
          end
        end
        return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  end
end





# REWRITE FUNCTION - CLASS
# Final Code Refactored


   # 38
  def bakery_num(customers, order)
    $foods = {"pie" => 8, "cake" => 6, "cookie" => 1}
    $order = order
    $customers = customers
    $pies = 0
    $cakes = 0
    $cookies = 0
    
    def pie_order
      $pies = $customers/$foods["pie"]
      $pies = $customers / $foods["pie"]
      $customers = $customers % $foods["pie"]
    end
  
    def cake_order
      $cakes = $customers/$foods["cake"]
      $customers = $customers % $foods["cake"]
    end

    def cookie_order
        $cookies = $customers 
    end
    
    case $order
    when "pie"
      return "You need to make #{$customers/$foods["pie"]} pie(s)." if $customers % $foods["pie"] == 0
      pie_order
      cake_order
      cookie_order
    when "cake"
      return "You need to make #{$customers/$foods["cake"]} cake(s)." if $customers % $foods["cake"] == 0
      cake_order
      cookie_order
    when "cookie"
      return "You need to make #{$customers} cookie(s)." 
    else
      raise ArgumentError.new("You can't make that food")
    end

    if $customers % $foods[order] != 0
      "You need to make #{$pies} pie(s), #{$cakes} cake(s), and #{$cookies} cookie(s)."
    end
  end

 # *PSEUDO*
=begin
def function that takes two args 
my list hash
set pie cookie cake to 0
has fave is false

iterate through each key of list
=end
#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!


#Reflections


# Our final code is two lines longer than the original function, However it is much eaiser to read and modify for
# furture coders. It is also much easier to add aditional food products to this function so overall we 
# felt pretty good about it in the end. 