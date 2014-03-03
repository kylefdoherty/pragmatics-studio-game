require_relative 'player'
require_relative 'die'

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
		@players.each do |p|
			puts "#{p.name}'s health is #{p.health}"
		end
	end 

	def play
		@players.each do |p|
			puts p
		end 
		@players.each do |p|
			die = Die.new
			roll = die.roll

			case roll
			when 1..2
				p.kick
			when 3..4
				p.punch
			else 
				p.pizza
			end 
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