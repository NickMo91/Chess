require "byebug"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/queen.rb"
require_relative "./pieces/king.rb"
require_relative "./pieces/rook.rb"
require_relative "./pieces/knight.rb"
require_relative "./pieces/bishop.rb"
require_relative "./pieces/pawn.rb"
class Board
  def initialize
    @rows= Array.new(8) {Array.new(8)}
    @sentinel = NullPiece.instance
    make_board
    
  end
  attr_accessor :rows, :sentinel

  def make_board
    (0..7).each {|row|
      (0..7).each {|col|
        pos = [row, col]
        if pos == [0, 3] 
          add_piece(Queen.new("red", self, pos), pos)
        elsif pos == [7, 3]
          add_piece(Queen.new("white", self, pos), pos)
        elsif pos == [0, 0] || pos == [0, 7] 
          add_piece(Rook.new("red", self, pos), pos)
        elsif pos == [7, 0] || pos == [7, 7]
          add_piece(Rook.new("white", self, pos), pos)
        elsif pos == [0, 1] || pos == [0, 6]
          add_piece(Knight.new("red", self, pos), pos)
        elsif pos == [7, 1] || pos == [7, 6]
          add_piece(Knight.new("white", self, pos), pos)
        elsif pos == [0, 2] || pos == [0, 5] 
          add_piece(Bishop.new("red", self, pos), pos)
        elsif pos == [7, 2] || pos == [7, 5]
          add_piece(Bishop.new("white", self, pos), pos)
        elsif pos == [0, 4] 
          add_piece(King.new("red", self, pos), pos)
        elsif pos == [7, 4]
          add_piece(King.new("white", self, pos), pos)
        elsif pos[0] == 1 
          add_piece(Pawn.new("red", self, pos), pos)
        elsif pos[0] == 6
          add_piece(Pawn.new("white", self, pos), pos)
        else
          add_piece(NullPiece.instance, pos)
        end
      }
    }
  end

  def [](pos)#getter
    x, y = pos
    rows[x][y]
  end

  def []=(pos, val)#setter
    x, y = pos
    rows[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    # debugger
    
    # raise InvalidMoveError if self.rows[start_pos].nil? || !self.rows[end_pos].nil?
    temp = self[start_pos]
    if temp.is_a?(Rook)
      moves = temp.moves
      # moves.select {|move| self[move] == self.sentinel}
      if !moves.include?(end_pos)
        return
      else 
        self[end_pos] = temp 
        self[start_pos] = NullPiece.instance
        self[end_pos].pos = end_pos
      end
    end
    # if temp.is_a?(Rook) || temp.is_a?(Bishop) || temp.is_a?(Queen) #=> [[], [], []]
      #temp.class.move
    # elsif temp.is_a?(Knight) || temp.is_a?(King)
    # elsif temp.is_a?(Pawn)
    #   moves = temp.move_dirs
    # end
    self[end_pos] = temp 
    self[start_pos] = NullPiece.instance
  end

  def valid_pos?(pos)
    #
  end
  def add_piece(piece, pos)
    # debugger
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end


  def piece
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

 
end
