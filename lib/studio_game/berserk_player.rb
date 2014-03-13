require_relative 'player'

module StudioGame
	class BerserkPlayer < Player

		def initialize(name, health=100)
			super(name, health)
			@pizza_count = 0
		end 

		def berserk?
			@pizza_count > 5
		end 

		def pizza
			super
			@pizza_count += 1
			puts "#{@name} is berserk!!!" if berserk?
		end 

		def kick
			berserk? ? pizza : super
		end 

		def punch 
			berserk? ? pizza : super
		end 



	end
end

if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  10.times { berserker.pizza}
  2.times { berserker.kick}
  puts berserker.health
end
