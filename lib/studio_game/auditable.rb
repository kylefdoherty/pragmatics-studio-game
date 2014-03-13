module StudioGame
	module Auditable 

		def audit 
			puts "Rolled a #{@number} #{self.class}"  #need to call self becuase the method will be called within the die class
		end 

	end 
end 