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
end