class Board
  attr_reader :board
  WINS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def initialize
    @board = [' 1 | 2 | 3 ', '-----------', ' 4 | 5 | 6 ', '-----------', ' 7 | 8 | 9 ']
    @board_positions = Array.new(9)
  end 

  def to_s
    "#{board[0]}\n#{board[1]}\n#{board[2]}\n#{board[3]}\n#{board[4]}"
  end

end