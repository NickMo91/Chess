require_relative "piece"
require "byebug"
require_relative "slideable"

class Rook < Piece
  include Slideable
  def initialize(color, board, pos)
    @symbol = "Rook"
    super(color, board, pos)
  end
  attr_accessor :symbol
  
  def to_s
    if self.color == "red"
      "♜"
    else  
      "♖"
    end
  end
  
  def move_dirs
    [[1, 0], [-1, 0], [0, 1], [0, -1]] # deltas 
  end
end
