class Board
  attr_reader :board
  def initialize
    @board = ['   |   |   ', '-----------', '   |   |   ', '-----------', '   |   |   ']
    @board_positions = Array.new(3) { Array.new(3) }
  end 

  def to_s
    "#{board[0]}\n#{board[1]}\n#{board[2]}\n#{board[3]}\n#{board[4]}"
  end

end