#!/usr/bin/env ruby

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

puts "\n"
puts 'In this game, two players play in turns.
Each player chooses a number in the checkboard
The winner is the one who aligns three of his symbols
either horizontally, vertically or on the diagonal\n'

puts "Press 'Enter' to continue"
gets # Wait
system('clear') # Refresh the terminal

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

puts "It's your turn #{player_one_name}, choose a cell number"
gets.chomp

system('clear') # Refresh the terminal

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

puts "It's your turn #{player_two_name}, choose a cell number"
gets.chomp

system('clear') # Refresh the terminal

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

puts "The winner is #{player_one_name}, Congraturations!!!"

puts "Press 'Enter' to exit"
gets.chomp
system('clear')
