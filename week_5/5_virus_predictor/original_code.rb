# U2.W5: Virus Predictor

# I worked on this challenge [by myself, with: ].

# EXPLANATION OF require_relative
# require relative is just like require 
# except that require_relative works within the same directory

require_relative 'state_data'

class VirusPredictor

  # initialize takes and sets 5 variables as instance variable
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  # virus_effects is the only public method of the VirusPredictor class
  # this method serves only to call the private methods of this class
  # the 2 methods called do not need to be passed in arguments because they use instance
  # variables themselves.
  # during refactor I removed the speed_of_spread method and rolled its contents into predictied_deaths
  
  def virus_effects  
    predicted_deaths
    # speed_of_spread
  end
  
  #creates a method population which returns instance variable population
  
  attr_reader :population 

  # private makes everything below it a private method of the class. This means that the methods cannot be
  # called from instances of the class.
  # So you could not call Florida.predicted_deaths
  
  private  

  # private method, needs no arguments because it is working with instance variables
  # calculates number of deaths in a given state
  # rolled in code from speed_of_spread using existing logic structures. 
  
  def predicted_deaths
    speed = 0.0
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
      speed += 0.5
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
      speed += 1
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
      speed += 1.5
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
      speed += 2
    else 
      number_of_deaths = (@population * 0.05).floor
      speed += 2.5
    end
    
    # modified output return to be easier to read for your scientists. 
    # print "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across the state in #{speed} months.\n\n"
    print "#{@state}:\n Deaths: #{number_of_deaths}\n Outbreak Period: #{speed} months.\n\n"
  end

  # method not D.R.Y. - vanquished
  # 
  # def speed_of_spread(population_density, state) #in months
  #   speed = 0.0

  #   if @population_density >= 200
  #     speed += 0.5
  #   elsif @population_density >= 150
  #     speed += 1
  #   elsif @population_density >= 100
  #     speed += 1.5
  #   elsif @population_density >= 50
  #     speed += 2
  #   else 
  #     speed += 2.5
  #   end

  #   puts " and will spread across the state in #{speed} months.\n\n"

  # end

end



# *CLEAN REFACTOR*

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  attr_reader :population 

  def virus_effects  
    predicted_deaths
  end
      
  private  

  def predicted_deaths
    speed = 0.0

    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
      speed += 0.5
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
      speed += 1
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
      speed += 1.5
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
      speed += 2
    else 
      number_of_deaths = (@population * 0.05).floor
      speed += 2.5
    end
    
    print "#{@state}:\n Deaths: #{number_of_deaths}\n Population: #{@population}\n Outbreak Period: #{speed} months.\n\n"
  end

end

#=======================================================================

# DRIVER CODE

  # initialize VirusPredictor for each state
  # Created a method full_report which takes 1 argument
  # iterate through the inputs, using keys and values as placeholders
  # create variables for each variable needed to create a new instance of class VirusPredictor
  # set each variable to it's corresponding input hash value
  
def full_report(input)
  input.each do |key,value| 
    state = key 
    population_density = input[state][:population_density]
    population = input[state][:population]
    region = input[state][:region]
    regional_spread = input[state][:regional_spread]
    report = VirusPredictor.new(state, population_density, population, region, regional_spread)
    report.virus_effects
  end
end


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects

puts "Population Stats:"
puts "Alabama: #{alabama.population}"
puts "New Jersey: #{jersey.population}"
puts "California: #{california.population}"
puts "Alaska: #{alaska.population}"
puts

puts "Full Report:\n\n"
full_report(STATE_DATA)