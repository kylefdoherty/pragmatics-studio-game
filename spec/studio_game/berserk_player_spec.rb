require 'studio_game/berserk_player'

module StudioGame
  describe BerserkPlayer do
    
    before do
      @initial_health = 50 
      @player = BerserkPlayer.new("berserker", @initial_health)
    end
    
    it "does not go berserk when pizza'd up to 5 times" do
      1.upto(5) { @player.pizza }
      
      @player.berserk?.should be_false
    end
    
    it "goes berserk when pizza'd more than 5 times" do
      1.upto(6) { @player.pizza }
      
      @player.berserk?.should be_true
    end
    
    it "gets w00ted instead of blammed when it's gone berserk" do  
      1.upto(6) { @player.pizza }
      1.upto(2) { @player.kick}
      
      @player.health.should == @initial_health + (8 * 15)
    end

  end
end 