require_relative 'player'
require_relative 'game'

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
turtles.play(10) do #tell it to play n number of rounds
	turtles.total_points >= 2000
end
turtles.print_stats 
end 