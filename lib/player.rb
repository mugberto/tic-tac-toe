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

  def play(move)
    [move, @symbol]
  end

  def self.winner(win_sym)
    @@players[win_sym]
  end
end
# rubocop: enable Style/ClassVars
