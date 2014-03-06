
require_relative 'game'

$stdout = StringIO.new

describe Game do

  before do
    @game = Game.new("Turtles")

    @initial_health = 100
    @player = Player.new("Leo", @initial_health)
    
    @game.add_player(@player)
  end
  
  it "kicks a player if a low number is called" do

  	Die.any_instance.stub(:roll).and_return(1)

  	@game.play(2) #going to send the number of rounds we want the game to play. 

  	@player.health.should == @initial_health - (10*2) #becuase we're playing 2 rounds, the player gets kicked twice and thus health decreases by 20

  end

  it "punches the player if a medium number is called" do 
  	Die.any_instance.stub(:roll).and_return(3)

  	@game.play(2) 

	@player.health.should == @initial_health - (5*2)
  end  	

  it "Pizza Time a player if a high number is called" do 
  	Die.any_instance.stub(:roll).and_return(5)

  	@game.play(2)

	@player.health.should == @initial_health + (15*2)
  end 

  it "assigns a treasure for points during a player's turn" do     
    game = Game.new("Knuckleheads")
    player = Player.new("moe")
       
    game.add_player(player)
    
    game.play(1)
    
    player.points.should_not be_zero
  end 	

  it "computes total points as the sum of all player points" do
    game = Game.new("Knuckleheads")
    
    player1 = Player.new("moe")
    player2 = Player.new("larry")
    
    game.add_player(player1)
    game.add_player(player2)
    
    player1.found_treasure(Treasure.new(:hammer, 50))
    player1.found_treasure(Treasure.new(:hammer, 50))
    player2.found_treasure(Treasure.new(:crowbar, 400))
    
    game.total_points.should == 500
  end


end