require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
#game class that takes a title and stores players in an array 
class Game
	def initialize(name)
		@name = name 
		@players = []
	end 

	def add_player(player)
		@players << player
	end 

	def load_players(file)
		File.readlines(file).each do |line|
			add_player(Player.from_csv(line))
		end 
	end 


	def player_status
		@players.each do |player|
			puts "#{player.name}'s health is #{player.health}"
		end
	end 

	def play(rounds)
		puts "There are #{@players.size} players in the #{@name} game: "

		@players.each do |player|
			puts player
		end 

		treasures = TreasureTrove::TREASURES

		puts "\nAvailable Treasures:"
		treasures.each {|t| puts "#{t.name.to_s.ljust(30,'.')}#{t.points}"}
		puts "\n"
		
		rounds.times do |round|
			if block_given?
				if yield #if a block is given break out of the rounds loop if yield is true i.e. whatever block was passed in
					puts "\n***** Ended game becuase total points was greater than designated amount *****"
					break
				end
			end
				puts "\nRound #{round+1}"
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

	def total_points
		@players.inject(0) {|sum, player| sum + player.points}
	end 

	def high_scores(player)
		"#{player.name.ljust(30,'.')}#{player.score}"
	end 

	def print_stats
		strong_players, weak_players = @players.partition {|p| p.strong?}
		

		puts "\n#{@name} Stats:"
		puts "\nStrong Players:"
		strong_players.sort.each {|p| puts print_name_health(p)} unless strong_players.empty?
		puts "\nWeak Players:"
		weak_players.sort.each {|p| puts print_name_health(p)} unless weak_players.empty?

		puts "\nPlayer's Point Totals:"
		@players.each do |player|
			puts "\n#{player.name}'s Point Total:"

			player.each_found_treasure do |treasure| #calling the .each_found_treasure method on the player instance and passing it the block to puts out the treasure points and name which are reader attributes of the treasure object (struct in this case)
  				puts "#{treasure.points} total #{treasure.name} points"
			end

			puts "#{player.points} total points"
		end 

		puts "\nTotal Points - #{total_points}"


		puts "\n#{@name} High Scores:"
		@players.sort.each {|p| puts high_scores(p)} #defined own .sort method in player class that sorts by players score in descending order
		# sorted_players = @players.sort {|a,b| b.score <=> a.score} #sorted players by their score in descending order 
		# sorted_players.each {|p| puts "#{p.name.ljust(30,'.')}#{p.score}"}

	end 

	def save_high_scores(file="high_scores.txt")
		File.open(file, 'w') do |file| 
			file.puts "#{@name} High Scores:"
			@players.sort.each do |player| #defined own .sort method in player class that sorts by players score in descending order
				file.puts high_scores(player)
			end 
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