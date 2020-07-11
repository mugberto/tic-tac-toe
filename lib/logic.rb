class Board
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
          move_keeper([j, i], @cell[@k])
        else
          print j == 1 ? "| #{@k += 1} |" : " #{@k += 1} |"
        end
      end
      puts "\n" + '-' * 13
    end
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

  # Records xy positions of Xs or Os after every move in arrays
  def move_keeper(coord, sym)
    if sym == 'X'
      @x << coord
    elsif sym == 'O'
      @o << coord
    end
  end
end

board = Board.new
board.display(4, 'X')
board.display(5, 'O')
board.display(9, 'X')
board.display(7, 'O')
p board.moves('O')
