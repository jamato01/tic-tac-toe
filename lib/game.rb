class Game

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @board = Board.new
  end

  def start
    if rand(2) == 1
      puts "#{@player_1.name} will start."
      @current_player = @player_1
    else
      puts "#{@player_2.name} will start."
      @current_player = @player_2
    end
    self.position_select
  end

  def position_select
    puts @board
    puts "Select a position on the board"
    position = gets.chomp
    @board.turn(@current_player, position)
  end
end