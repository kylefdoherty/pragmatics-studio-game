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

	def play(rounds)
		puts "There are #{@players.size} players in #{@title}: "

		@players.each do |player|
			puts player
		end 
		
		rounds.times do
			@players.each do |player|
			GameTurn.take_turn(player)
			puts player
			end 
			player_status
		end 
		
	end 

	def print_name_health(p)
		"#{p.name}'s Health".ljust(30,'.') + "#{p.health}" #moving this formatting into a method so it can be reused in other places and so if I want to change it I only have to do so in one place
	end

	def print_stats
		strong_players, weak_players = @players.partition {|p| p.strong?}
		

		puts "\n#{@name} Stats:"
		puts "\nStrong Players:"
		strong_players.sort.each {|p| puts print_name_health(p)} unless strong_players.empty?
		puts "\nWeak Players:"
		weak_players.sort.each {|p| puts print_name_health(p)} unless weak_players.empty?


		puts "\n#{@name} High Scores:"
		@players.sort.each {|p| puts "#{p.name.ljust(30,'.')}#{p.score}"}
		# sorted_players = @players.sort {|a,b| b.score <=> a.score} #sorted players by their score in descending order 
		# sorted_players.each {|p| puts "#{p.name.ljust(30,'.')}#{p.score}"}
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