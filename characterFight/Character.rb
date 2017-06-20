class Character

  attr_accessor :current_hits, :strength, :agility, :hit_points
  attr_reader :name, :race, :weapon, :armor

  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    @hit_points = hit_points
    @strength = strength
    @agility = agility
    @weapon = weapon
    @armor = armor
    @current_hits = @hit_points
  end


  def to_s
    ret_str = "This is #{@name}, they are of the #{@race} race. They have #{@hit_points} hit points. They appear to have
a strength of #{@strength} and an agility of #{@agility}. They weild their #{@weapon} (Power: #{weapon.damage_hits.to_s})
skillfully and are protected by their #{@armor} (Defense: #{armor.protection_hits.to_s}).\n\n"
  end





  def current_status
    ret_str = "#{@name} has #{@current_hits} out of #{@hit_points} hit points remaining."
    return ret_str
  end


  def revive_character
    @current_hits = @hit_points
  end


  def reduce_hits(hits)
    @current_hits -= hits
    if @current_hits < 0
      @current_hits = 0
    end
    return @current_hits
  end




  def roll
    dAgile = Die.new(@agility)
    agility_roll = dAgile.roll
    return agility_roll
  end


  def fight
    ret_str = "#{@name} fights with the #{weapon.name}!"
    return ret_str
  end


end
