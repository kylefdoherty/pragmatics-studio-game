module Playable 

	def kick
		self.health -= 10
		puts "#{name} was kicked in the face...ouch!...#{name}'s health decreased by 10"
	end 

	def punch 
		self.health -= 5
		puts "#{name} was punched in the gut...oooh!...#{name}'s health decreased by 5"
	end 

	def pizza
		self.health += 15
		puts "PIZZA TIME!!!....+15 health for #{name}"
	end

	def strong?
		health > 100
	end

end 