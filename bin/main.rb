#!/usr/bin/env ruby

# The app runs the code below to describe briefly the game

system('clear') # Reset the terminal

puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

k = 1
3.times do
  puts '-------------'
  3.times { |i| print "| #{k + i} " }
  puts '|'
  k += 3
  puts '-------------' if k > 7
end

puts "\nIn this game, two players play in turns.
Each player chooses a number in the checkboard
The winner is the one who aligns three of his symbols
either horizontally, vertically or on the diagonal\n"

puts "Press 'Enter' to continue"
gets # Wait
system('clear') # Refresh the terminal

# The code below asks players to input their names
puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

puts "Enter the first player's name (default: Player A)"
player_one_name = gets.chomp
player_one_symbol = 'X'

puts "Enter the second player's name (default: Player B)"
player_two_name = gets.chomp
player_two_symbol = 'O'
system('clear') # Refresh the terminal

# Function definition of a wrong move handler
def not_valid_move?(num)
  # returns true the selected number is already was already selected or is not on the board
end

# Here start a loop in which player's turns are repeated until a win or a draw occurs

# Player A turn: The code below displays the board and asks the Player A
# to input a number corresponding to the cell they want to mark
puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

puts "#{player_one_name}(#{player_one_symbol})  VS  #{player_two_name}(#{player_two_symbol})\n"

k = 1
3.times do
  puts '-------------'
  3.times { |i| print "| #{k + i} " }
  puts '|'
  k += 3
  puts '-------------' if k > 7
end

puts "\nIt's your turn #{player_one_name}, choose a cell number"
move = gets.chomp

if not_valid_move?(move)
  puts 'Invalid move'
  # Repeat the Player A turn
end

system('clear') # Refresh the terminal

# The code below displays the board and asks the Player B to input a number corresponding to the cell they want to mark
puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

puts "#{player_one_name}(#{player_one_symbol})  VS  #{player_two_name}(#{player_two_symbol})\n"

k = 1
3.times do
  puts '-------------'
  3.times { |i| print "| #{k + i} " }
  puts '|'
  k += 3
  puts '-------------' if k > 7
end

puts "\nIt's your turn #{player_two_name}, choose a cell number"
move = gets.chomp

if not_valid_move?(move)
  puts 'Invalid move'
  # Repeat the Player A turn
end

system('clear') # Refresh the terminal

# End of the loop

# If the loop break is due to a win

# The code below diplays the board and the winner after a winning move
puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

puts "#{player_one_name}(#{player_one_symbol})  VS  #{player_two_name}(#{player_two_symbol})\n"

k = 1
3.times do
  puts '-------------'
  3.times { |i| print "| #{k + i} " }
  puts '|'
  k += 3
  puts '-------------' if k > 7
end

puts "\nThe winner is #{player_one_name}, Congraturations!!!"

# If the loop break was due to a draw

# The code below diplays the board and indicates the game is a draw
puts "\n"
puts 'TIC TAC TOE'
puts '-----------'
puts "\n"

puts "#{player_one_name}(#{player_one_symbol})  VS  #{player_two_name}(#{player_two_symbol})\n"

k = 1
3.times do
  puts '-------------'
  3.times { |i| print "| #{k + i} " }
  puts '|'
  k += 3
  puts '-------------' if k > 7
end

puts "\nThere is no winning move possible, It is draw!"

puts "Press 'Enter' to exit"
gets.chomp
system('clear')
