require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable
  def initialize(color, board, pos)
    @symbol = "Queen"
    super(color, board, pos)
  end
  attr_accessor :symbol
  
  def to_s
    if self.color == "red"
      "♛"
    else  
      "♕"
    end
  end
end


#red light red yellow light yellow cyan magenta white black green blue