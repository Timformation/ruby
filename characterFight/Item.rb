###################################   ITEM CLASS ######################################

class Item

  attr_reader :name

  def initialize(name)
    @name = name
  end



  def to_s
    ret_str = "#{@name}"
  end
end


###################################   WEAPON CLASS ######################################


class Weapon < Item

  attr_reader :name, :damage_hits

  def initialize(name, damage_hits)
    super(name)
    @damage_hits = damage_hits
  end



  def to_s
    return name
  end
end

###################################   ARMOR CLASS ######################################

class Armor < Item

  attr_reader :name, :protection_hits

  def initialize(name, protection_hits)
    super(name)
    @protection_hits = protection_hits
  end



  def to_s
    return name
  end
end