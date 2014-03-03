require_relative 'die'
require_relative 'player'

module GameTurn

	def self.take_turn(player)
		die = Die.new
			roll = die.roll

			case roll
			when 1..2
				player.kick
			when 3..4
				player.punch
			else 
				player.pizza
			end 
	end
end