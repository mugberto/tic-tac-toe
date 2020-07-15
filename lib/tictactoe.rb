module TicTacToe
  TITLE = "\nTIC TAC TOE\n-----------\n".freeze
  DESCRIPTION = "\nIn this game, two players play in turns.\nEach player chooses a number \
in the board\nThe winner is the one who aligns three of his symbols\neither horizontally, \
vertically or on the diagonal\n".freeze

  def self.display_winner(winner)
    puts "\n#{winner} is the winner! Congraturations.\n"
    puts "Press 'Enter' to exit"
    gets # Waiting for the user to press enter
  end

  def self.display_draw
    puts "\nNo possible winning move left! The game is a draw.\n"
    puts "Press 'Enter' to exit"
    gets # Waiting for the user to press enter
  end
end
