class Board
  attr_reader :board

  def initialize
    @board = [' 1 | 2 | 3 ', '-----------', ' 4 | 5 | 6 ', '-----------', ' 7 | 8 | 9 ']
  end 

  def to_s
    "#{board[0]}\n#{board[1]}\n#{board[2]}\n#{board[3]}\n#{board[4]}"
  end

  
  def turn(player, position)
    # debugger
    if board.any? { |inner| inner.include?(position) }
      board.each { |inner| inner.sub!(position, player.game_symbol) }
      puts board
      player.update_position(position)
    else
      puts "Not a valid position."
    end

  end
end