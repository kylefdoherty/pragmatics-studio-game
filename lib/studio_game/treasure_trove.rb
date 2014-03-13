Treasure = Struct.new(:name, :points)

module StudioGame
  module TreasureTrove

  TREASURES = [

      Treasure.new(:pie,        5),
      Treasure.new(:bottle,     25),  
      Treasure.new(:hammer,     50),
      Treasure.new(:skillet,    100),
      Treasure.new(:broomstick, 200),
      Treasure.new(:crowbar,    400)

    ]

    def self.random 
    	TREASURES.sample
    end 
  end

  # TREASURES = [
  # 	Treasure.new(:crossbow, 50),
  # 	Treasure.new(:water, 15), 
  # 	Treasure.new(:first_aid_kit, 30), 
  # 	Treasure.new(:knife, 20), 
  # 	Treasure.new(:mre, 15)
  # ]

end 