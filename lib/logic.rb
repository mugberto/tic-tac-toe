class Board
  def initialize
    @cell = {}
  end

  def display(*args)
    @cell[args[0]] = args[1]
    @k = 0
    (0..2).each do |i|
      puts '-' * 13 if i.zero?
      (0..2).each do |j|
        if @cell.key?(@k + 1)
          print j.zero? ? "| #{@cell[@k += 1]} |" : " #{@cell[@k += 1]} |"
        else
          print j.zero? ? "| #{@k += 1} |" : " #{@k += 1} |"
        end
      end
      puts "\n" + '-' * 13
    end
  end
end

board = Board.new
board.display(2, 'O')
