require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/game"

puts "What is player 1's name? They will be O's."
p1name = gets.chomp
puts "\nWhat is player 2's name? They will be X's."
p2name = gets.chomp

player1 = Player.new(p1name, "O")
player2 = Player.new(p2name, "X")

new_game = Game.new(player1, player2)
new_game.start
