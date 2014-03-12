require_relative 'player.rb'

class ClumsyPlayer < Player

	def initialize(name, health=100, boost=10)
		super(name,health)
		@boost = boost
	end 

	def found_treasure(treasure)#passes in the specifc treasure object such as a :hammer
		damaged_treasure = Treasure.new(treasure.name, treasure.points / 2) #create a new treasure object from the original by passing the original's name and halving its points
		super(damaged_treasure) #call super and pass it the damaged treasure.  By calling super it looks in the parent class of ClumsyPlayer for the method found_treasure and passes it the new treasure object created 
	end

	def pizza
		@boost.times {super}
	end






end 


if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")  
  
  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  
  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)

  clumsy.pizza
  
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
  puts "#{clumsy.health} health points"
end