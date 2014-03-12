require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'game'

if $0 == __FILE__
playerA = Player.new("leo")
playerB = Player.new("mikey")
playerC = Player.new("donnie")
playerD = Player.new("raph")


turtles = Game.new("Turtles")
turtles.load_players(ARGV.shift || "players.csv") #if there is something in ARGV array use that else use players.csv which is the default
klutz = ClumsyPlayer.new("klutz", 105)
turtles.add_player(klutz)
berserker = BerserkPlayer.new("berserker", 50)
turtles.add_player(berserker)


# turtles.add_player(playerA)
# turtles.add_player(playerB)
# turtles.add_player(playerC)
# turtles.add_player(playerD)

loop do 
puts "How many rounds do you want to play?"
answer = gets.chomp.downcase
	case answer 
	when /^\d+$/
		turtles.play(answer.to_i) do #tell it to play n number of rounds
			turtles.total_points >= 1000000
		end 
	when "exit", "quit"
		turtles.print_stats 
		break
	else 
		puts "enter a number or quit"
	end 
end 
turtles.save_high_scores
end 