class Die

  attr_reader :num_sides

  def initialize(num_sides)
    @num_sides = num_sides
  end

  def roll
    roll = rand(1..num_sides)
  end
end


