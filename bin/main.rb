#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/tictactoe'

board = Board.new

system('clear')

puts TicTacToe::TITLE

puts board.display

puts TicTacToe::DESCRIPTION

puts "Press 'Enter' to continue"
gets
system('clear')

puts TicTacToe::TITLE

puts "Enter the first player's name [default: Player A]"
player_one = Player.new(gets.chomp)

puts "Enter the second player's name [default: Player B]"
player_two = Player.new(gets.chomp)

system('clear')

def accept_move(board)
  ok = false
  until ok
    move = gets.chomp
    if /[1-9]/ =~ move && move.size == 1
      if board.cell.key?(move.to_i)
        puts 'The cell you chose is already taken. Please enter another number.'
      else
        ok = true
      end
    else
      puts 'You entered the wrong number. Please enter a single digit, from 1 to 9'
    end
  end
  move.to_i
end

i = 0
move = nil
loop do
  puts TicTacToe::TITLE
  puts "\n#{player_one.name}(#{player_one.symbol})  VS  #{player_two.name}(#{player_two.symbol})\n"
  puts board.display(move)

  if board.win?
    puts "\n#{Player.winner(board.win_sym)} is the winner! Congraturations.\n"
    puts "Press 'Enter' to exit"
    gets
    break
  end

  if board.draw?
    puts "\nNo possible winning move left! The game is a draw.\n"
    puts "Press 'Enter' to exit"
    gets
    break
  end

  if i.even?
    puts "It's your turn '#{player_one.name}', Mark a cell by picking a number"
    move = player_one.play(accept_move(board))
  else
    puts "It's your turn '#{player_two.name}', Mark a cell by picking a number"
    move = player_two.play(accept_move(board))
  end

  i += 1
  system('clear')
end

system('clear')
