class Player 
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health 
	end 

	def w00t
		puts "#{@name} got w00ted"
		@health += 15

	end 

	def blam
		puts "#{@name} got blamed"
		@health -= 10
	end 

	def to_s
		"I'm #{@name} wtih a health of #{@health} and a score of #{score}"
	end

	def score 
		@name.length + @health
	end 

	def name=(new_name)
		@name = new_name.capitalize
	end 
end 


class Game 
	attr_reader :title

	def initialize(title) 
		@title = title
		@players = []
	end 

	def add_player(player)
		@players << player
	end 

	def play 
		puts "There are #{@players.size} players in #{@title}"
		@players.each do |p|
			puts p #this prints the contents of the .to_s method in each instance of the 
		end 
		@players.each do |p|
			p.blam
			p.w00t
			p.w00t
			p.w00t
			p.blam
			puts p
		end
	end 

end


player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)


knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play 





# players = [player1, player2, player3]

# players.each do |p|
# 	puts p
# 	puts p.health
# 	p.w00t
# 	p.blam
# 	puts p
# end 