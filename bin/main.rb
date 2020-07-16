#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/tictactoe'

board = Board.new

system('clear') # Reset the terminal

puts TicTacToe::TITLE

board.display

puts TicTacToe::DESCRIPTION

puts "Press 'Enter' to continue"
gets # Wait
system('clear') # Reset the terminal

puts TicTacToe::TITLE

puts "Enter the first player's name [default: Player A]"
player_one = Player.new(gets.chomp)

puts "Enter the second player's name [default: Player B]"
player_two = Player.new(gets.chomp)

system('clear') # Reset the terminal

i = 0
move = nil
loop do
  puts TicTacToe::TITLE
  puts "\n#{player_one.name}(#{player_one.symbol})  VS  #{player_two.name}(#{player_two.symbol})\n"
  board.display(move)

  if board.win?
    TicTacToe.display_winner(Player.winner(board.win_sym))
    break
  end

  if board.draw?
    TicTacToe.display_draw
    break
  end

  move = i.even? ? player_one.play(board) : player_two.play(board)
  i += 1
  system('clear')
end

system('clear')
