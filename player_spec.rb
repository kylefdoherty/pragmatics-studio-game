require_relative 'player'


$stdout = StringIO.new #this redirects the $stdout to the new IO object and thus the puts that happen with the .pizza, .kick, and .punch methods aren't outputed in our tests


describe Player do 

	before do 
		@initial_health = 100
		@player = Player.new('mikey', @initial_health)
	end 

	it "has a capitalized name" do 
		#build state 
		# player = Player.new('mikey', 100) #here we're craeting a new player with the name 'mikey' in lowercase and the health of 100 
		
		@player.name.should == 'Mikey' #here we are checking if the code we invoked above results in the name 'Mikey' capitalized.  
									  #In other words we're checkingn to see if we have the .capitalize method called on the name we pass into the .intialize method

	end 

	it "has an initial health" do 

		@player.health.should == 100
	end 

	it "has a string representation" do 

		@player.to_s.should == "Mikey's health................100"	
	end 

	it "computes a score as the sum of its health and length of name" do 

		@player.score.should == 105
	
	end 


	it "increases health by 15 when PIZZA TIME" do
		@player.pizza

		@player.health.should == 115		 

	end 

	it "decreases health by 10 when kicked" do 
		@player.kick

		@player.health.should == 90
	end 


	it "decreases health by 5 when punched" do 
		@player.punch

		@player.health.should == 95

	end 



end 