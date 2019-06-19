require_relative "piece"

class King < Piece
  def initialize(color, board, pos)
    @symbol = "King"
    super(color, board, pos)
  end
  attr_accessor :symbol
 
  def to_s
    if self.color == "red"
      "♚"
    else  
      "♔"
    end
  end
end
