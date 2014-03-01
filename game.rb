require_relative 'player'
#game class that takes a title and stores players in an array 
class Game
	def initialize(name)
		@name = name 
		@players = []
	end 

	def add_player(player)
		@players << player
	end 

	def play
		@players.each do |p|
			puts p
		end 
		@players.each do |p|
			p.kick
			p.punch 
			p.kick
			p.pizza
			puts p
		end 
	end 

end

if $0 == __FILE__
playerA = Player.new("leo")
playerB = Player.new("mikey")
playerC = Player.new("donnie")
playerD = Player.new("raph")


turtles = Game.new("Turtles")
turtles.add_player(playerA)
turtles.add_player(playerB)
turtles.add_player(playerC)
turtles.add_player(playerD)
turtles.play 
end 