module TicTacToe
  TITLE = "\nTIC TAC TOE\n-----------\n".freeze
  DESCRIPTION = "\nIn this game, two players play in turns.\nEach player chooses a number \
in the checkboard\nThe winner is the one who aligns three of his symbols\neither horizontally, \
vertically or on the diagonal\n".freeze

  def display_winner(sym)
    puts TITLE
    board.display
    puts "\n#{Player.winner(sym)} is the winner! Congraturations.\n"
    puts "Press 'Enter' to exit"
    gets
  end

  def display_draw()
    puts TITLE
    board.display
    puts "\nNo possible winning move left! The game is a draw.\n"
    puts "Press 'Enter' to exit"
    gets
  end
end

class Board
  WINING_SEQUENCES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze
  attr_reader :cell
  def initialize
    @cell = {}
  end

  def display(arg = nil)
    @cell[arg[0]] = arg[1] unless arg.nil?
    @k = 0
    @x = []
    @o = []
    (1..3).each do |i|
      puts '-' * 13 if i == 1
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

  def draw?
    @cell.count == 9
  end

  def win_sym
    @cell.values.last
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
  @@players = {}
  @@player = 'Player A'
  @@sym = 'X'
  attr_accessor :name, :symbol
  def initialize(name, sym = @@sym)
    self.name = name == '' ? @@player : name
    self.symbol = sym
    @@players[sym] = name
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


# player_one = Player.new
# player_two = Player.new

# # p player_two.play

# # puts player_one.symbol
# # puts player_two.symbol

# board = Board.new
# board.display
# board.display([4, player_one.symbol])
# board.display([5, player_two.symbol])
# board.display([9, player_one.symbol])
# board.display([7, player_two.symbol])
# board.display([6, player_one.symbol])
# board.display
# p board.win?
# p board.win_sym
# p Player.winner(board.win_sym)
