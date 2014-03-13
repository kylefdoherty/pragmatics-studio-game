require 'studio_game/player'


$stdout = StringIO.new #this redirects the $stdout to the new IO object and thus the puts that happen with the .pizza, .kick, and .punch methods aren't outputed in our tests

module StudioGame
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

			@player.to_s.should == "Mikey's health is 100 and score is 100"
		end 

		it "computes a score as the sum of its health and points" do 
			@player.found_treasure(Treasure.new(:hammer, 50))
	  		@player.found_treasure(Treasure.new(:hammer, 50))

			@player.score.should == 200
		
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

		context "when health is greater than 100" do 

			before do 
				@player = Player.new('Kyle', 150)
			end 

			it "is Strong" do 
				@player.should be_strong
			end
		end 

		context "when health is less than or equal to 100" do 

			before do 
				@player = Player.new('Bob', 99)
			end 

			it "is Weak" do 
				@player.should_not be_strong
			end
		end 

		context "in a collection of players" do
	  		before do
			    @player1 = Player.new("moe", 100)
			    @player2 = Player.new("larry", 200)
			    @player3 = Player.new("curly", 300)

			    @players = [@player1, @player2, @player3]
	  		end
	  
	  		it "is sorted by decreasing score" do
	    		@players.sort.should == [@player3, @player2, @player1]
	  		end
		end

		it "computes points as the sum of all treasure points" do
		  @player.points.should == 0

		  @player.found_treasure(Treasure.new(:hammer, 50))

		  @player.points.should == 50

		  @player.found_treasure(Treasure.new(:crowbar, 400))
		  
		  @player.points.should == 450
		  
		  @player.found_treasure(Treasure.new(:hammer, 50))

		  @player.points.should == 500
		end

		it "yields each found treasure and its total points" do
		  @player.found_treasure(Treasure.new(:skillet, 100))
		  @player.found_treasure(Treasure.new(:skillet, 100))
		  @player.found_treasure(Treasure.new(:hammer, 50))
		  @player.found_treasure(Treasure.new(:bottle, 5))
		  @player.found_treasure(Treasure.new(:bottle, 5))
		  @player.found_treasure(Treasure.new(:bottle, 5))
		  @player.found_treasure(Treasure.new(:bottle, 5))
		  @player.found_treasure(Treasure.new(:bottle, 5))
	  
		  yielded = []
		  @player.each_found_treasure do |treasure|
		    yielded << treasure
	  	end
	  
		 	yielded.should == [
		    Treasure.new(:skillet, 200), 
		    Treasure.new(:hammer, 50), 
		    Treasure.new(:bottle, 25)
		 	]
		end

		it "can be created from a CSV string" do  
	  		player = Player.from_csv("larry,150")

	  		player.name.should == "Larry"
	  		player.health.should == 150
		end

	end 
end 