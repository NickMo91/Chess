require_relative "piece"
require "colorize"

class Bishop < Piece
  def initialize(color, board, pos)
    @symbol = "Bishop"
    super(color, board, pos)
  end
  attr_accessor :symbol
  
  def to_s
    if self.color == "red"
      "♝"
    else  
      "♗"
    end
  end

end
