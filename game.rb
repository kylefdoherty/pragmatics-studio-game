require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
#game class that takes a title and stores players in an array 
class Game
	def initialize(name)
		@name = name 
		@players = []
	end 

	def add_player(player)
		@players << player
	end 

	def player_status
		@players.each do |player|
			puts "#{player.name}'s health is #{player.health}"
		end
	end 

	def play
		puts "There are #{@players.size} players in #{@title}: "

		@players.each do |player|
			puts player
		end 
		
		@players.each do |player|
		GameTurn.take_turn(player)
		puts player
		end 
		player_status
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