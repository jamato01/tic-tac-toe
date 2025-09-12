class Player
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  attr_accessor :name, :game_symbol
  
  def initialize(name, symbol)
    self.name = name
    self.game_symbol = symbol
    @board_positions = Array.new(9)
  end

  def to_s
    "Player name is #{self.name} and is using #{self.game_symbol}'s."
  end

  def update_position(position)
    @board_positions[position.to_i] = position.to_i
    self.check_if_won
  end

  def check_if_won
    WINS.each do |win_condition|
      if win_condition.all? { |win_position| @board_positions.include?(win_position) }
        puts "#{self.name} wins the game! The winning board:"

      end
    end
  end
end