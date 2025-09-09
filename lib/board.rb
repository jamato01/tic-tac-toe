class Board
  
  def initialize
    @board = ['   |   |   ', '-----------', '   |   |   ', '-----------', '   |   |   ']
    @board_positions = Array.new(3) { Array.new(3) }
  end 
end