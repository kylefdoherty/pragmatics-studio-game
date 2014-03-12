require_relative 'treasure_trove'
#player class - has name & health.  has kick & punch methods that decrease health by 10 & 5 respectively. has a pizza method that restores 15 health
class Player
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@found_treasures = Hash.new(0) #you have to create a hash with a default value of 0 otherwise the found treasure method will throw an error becuase it's trying to run the + method on nil
	end 

	def self.from_csv(line)
		name, health = line.split(",")
		player = Player.new(name, Integer(health))
	end 

	def kick
		@health -= 10
		puts "#{name} was kicked in the face...ouch!...#{@name}'s health decreased by 10"
	end 

	def punch 
		@health -= 5
		puts "#{name} was punched in the gut...oooh!...#{@name}'s health decreased by 5"
	end 

	def pizza
		@health += 15
		puts "PIZZA TIME!!!....+15 health for #{name}"
	end


	def found_treasure(treasure)#passes in the specifc treasure object such as a :hammer
		@found_treasures[treasure.name] += treasure.points #stores each treasure's name and point value in the @found_treasure hash
		puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
		puts "#{@name}'s treasures: #{@found_treasures}"
	end

	def each_found_treasure #creating a method that yields to a block
		@found_treasures.each do |k,v| #takes the @found_treasure hash and loops through its keys and values
			yield(Treasure.new(k,v)) #it creates a Treasure object, using the treasure struct and yields that block that was passed to the each_found_treasure method
		end #the reason for creating this method instead of making the @found_treasures hash readable with atrr_reader is to not expose how player stores its treasures to the game method. This way the game method isn't reliant on the player class' implementation i.e. "unnecessary coupling"
	end 	#the way we're doing it here the game class is able to iterate through each players treasures & its point totals in a way that does not share the @found_treasure hash to the game class 


	def points #gives the total treasure points the player has
		@found_treasures.values.inject(0, :+)
	end 


	def score 
		@health + points
	end 

	def to_s
		"#{@name}'s health is #{@health} and score is #{score}"
	end

	def strong?
		if @health <= 100
			false
		else 
			true
		end 
	end

	def <=>(player)
		player.score <=> score #compares the players and now orders them in descending order 
	end 
end 

