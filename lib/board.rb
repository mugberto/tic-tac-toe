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

  def move_keeper(pos, sym)
    if sym == 'X'
      @x << pos
    elsif sym == 'O'
      @o << pos
    end
  end
end
