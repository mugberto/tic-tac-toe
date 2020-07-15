module TicTacToe
  TITLE = "\nTIC TAC TOE\n-----------\n".freeze
  DESCRIPTION = "\nIn this game, two players play in turns.
  Each player chooses a number in the checkboard
  The winner is the one who aligns three of his symbols
  either horizontally, vertically or on the diagonal\n".freeze
  WINING_SEQUENCES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze

  def reset_terminal
    system('clear')
    puts TITLE
  end

end

class Board
  include TicTacToe
  def initialize
    @cell = {}
  end

  def display(*args)
    @cell[args[0]] = args[1]
    @k = 0
    @x = []
    @o = []
    (1..3).each do |i|
      puts '-' * 13 if i.zero?
      (1..3).each do |j|
        if @cell.key?(@k + 1)
          print j == 1 ? "| #{@cell[@k += 1]} |" : " #{@cell[@k += 1]} |"
          move_keeper(@k, @cell[@k])
        else
          print j == 1 ? "| #{@k += 1} |" : " #{@k += 1} |"
        end
      end
      puts "\n" + '-' * 13
    end
  end

  def win?
    bool = false
    if @cell.values.last == 'X'
      WINING_SEQUENCES.each do |ary|
        bool = true if ary.count { |i| @x.include?(i) } == 3
      end
    else
      WINING_SEQUENCES.each do |ary|
        bool = true if ary.count { |i| @o.include?(i) } == 3
      end
    end
    bool
  end

  # A getter for Xs or Os positions
  def moves(sym)
    if sym == 'X'
      @x
    else
      @o
    end
  end

  private

  # Records positions after every player's move in arrays
  def move_keeper(pos, sym)
    if sym == 'X'
      @x << pos
    elsif sym == 'O'
      @o << pos
    end
  end
end

class Player
  @@player = 'Player A'
  @@symbol = 'X'
  attr_accessor :name, :symbol
  def initialize(name = @@player, symbol = @@symbol)
    self.name = name
    self.symbol = symbol
    @@player = 'Player B'
    @@symbol = 'O'
  end
end

player_one = Player.new
player_two = Player.new

puts player_one.name
puts player_two.name

board = Board.new
board.display(4, player_one.symbol)
board.display(5, player_two.symbol)
board.display(9, player_one.symbol)
board.display(7, player_two.symbol)
board.display(6, player_one.symbol)
system('clear')
board.display(3, player_two.symbol)
p board.win?
