class Game

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @board = Board.new
  end

  def start
    if rand(2) == 1
      puts "\n#{@player_1.name} will start."
      @current_player = @player_1
    else
      puts "\n#{@player_2.name} will start."
      @current_player = @player_2
    end
    puts @board
    self.next_turn
  end

  def position_select
    # puts @board
    puts "\n#{@current_player}, select a position on the board"
    position = gets.chomp
    @board.turn(@current_player, position)
  end

  def next_turn
    self.position_select
    if @current_player.check_if_won
      puts "\n#{@current_player} wins the game!"
      puts @board
    elsif !@board.to_s.match(/[1-9]/)
      puts "\nIt's a cat's game! No one wins."
    else
      self.switch_player
      self.next_turn
    end
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end
end