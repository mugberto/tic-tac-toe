class Board
  def display
    k = 0
    (0..2).each do |i|
      puts '-' * 13 if i.zero?
      (0..2).each { |j| print j.zero? ? "| #{k += 1} |" : " #{k += 1} |" }
      puts "\n" + '-' * 13
    end
  end
end

board = Board.new
board.display
