class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = Board.new
  end

  def start
    if rand(2) == 1
      puts "\n#{@player1.name} will start."
      @current_player = @player1
    else
      puts "\n#{@player2.name} will start."
      @current_player = @player2
    end
    puts @board
    next_turn
  end

  def position_select
    puts "\n#{@current_player}, select a position on the board"
    position = gets.chomp
    @board.turn(@current_player, position)
  end

  def next_turn
    is_turn_complete = position_select
    if @current_player.check_if_won
      puts "\n#{@current_player} wins the game! The winning board:"
      puts "\n#{@board}"
    elsif !@board.to_s.match(/[1-9]/)
      puts "\nIt's a cat's game! No one wins."
    elsif is_turn_complete
      switch_player
      next_turn
    else
      next_turn
    end
  end

  def switch_player
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end
end
