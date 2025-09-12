class Player
  attr_accessor :name
  
  def initialize(name, symbol)
    self.name = name
    @symbol = symbol
  end

  def to_s
    "Player name is #{self.name} and is using #{@symbol}'s."
  end
end