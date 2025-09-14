require 'colorize'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

puts "What is player 1's name? They will be O's."
p1_name = gets.chomp
puts "\nWhat is player 2's name? They will be X's."
p2_name = gets.chomp

player_1 = Player.new(p1_name, 'O')
player_2 = Player.new(p2_name, 'X')

new_game = Game.new(player_1,player_2)
new_game.start