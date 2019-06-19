require_relative "piece"

class Knight < Piece
  def initialize(color, board, pos)
    @symbol = "Knight"
    super(color, board, pos)
  end
  attr_accessor :symbol

  def to_s
    if self.color == "red"
      "♞"
    else  
      "♘"
    end
  end
end
