require_relative "piece"
require "colorize"

class Pawn < Piece
  def initialize(color, board, pos)
    @symbol = "Pawn"
    super(color, board, pos)
  end
  attr_accessor :symbol
  
  def to_s
    if self.color == "red"
      "♟"
    else  
      "♙"
    end
  end

  def moves
    result = []
     if self.color == "red"
      result << [self.pos[0] + 1, self.pos[1]]
    elsif self.color == "white"
      result << [self.pos[0] - 1, self.pos[1]]
    end
    result
  end

end
