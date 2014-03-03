#player class - has name & health.  has kick & punch methods that decrease health by 10 & 5 respectively. has a pizza method that restores 15 health
class Player
	attr_accessor :name
	attr_reader :health

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
		@score = 0
	end 

	def kick
		@health -= 10
		puts "#{name} was kicked in the face...ouch!...#{@name}'s health decreased by 10"
	end 

	def punch 
		@health -= 5
		puts "#{name} was punched in the gut...oooh!...#{@name}'s health decreased by 5"
	end 

	def pizza
		@health += 15
		puts "PIZZA TIME!!!....+15 health for #{name}"
	end 

	def score 
		@score = @name.length + @health
	end 

	def to_s
		current_health = "#{name}'s health"
		"#{current_health.ljust(30,'.')}#{@health}"
	end

	def strong?
		if @health <= 100
			false
		else 
			true
		end 
	end
end 

