# rubocop: disable Style/ClassVars
class Player
  @@players = {}
  @@player = 'Player A'
  @@sym = 'X'
  attr_accessor :name, :symbol
  def initialize(name, sym = @@sym)
    self.name = name == '' ? @@player : name
    self.symbol = sym
    @@players[sym] = @name
    @@player = 'Player B'
    @@sym = 'O'
  end

  def play(board)
    puts "It's your turn '#{@name}', Mark a cell by picking a number"
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
    [move.to_i, @symbol]
  end

  def self.winner(win_sym)
    @@players[win_sym]
  end
end
# rubocop: enable Style/ClassVars
