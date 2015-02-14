class User < ActiveRecord::Base
    has_many :game_equipments
  
  def has_equipment?(name)
    return user.game_equipments.to_a.select {|x| x.name == 'sword' && x.quantity > 0 }.length > 0
  end
    
end
