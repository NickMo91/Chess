require_relative "board"
require "colorize"
require_relative "cursor"
require "byebug"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    update
  end

  attr_accessor :board, :cursor

  def render 
    (0..7).each do |row|
      (0..7).each do |col|
        # debugger
        if cursor.cursor_pos == [row, col] 
          if cursor.selected
            print "#{board[[row, col]]} ".on_light_magenta
          else 
            print "#{board[[row, col]]} ".on_light_cyan
          end
        else
          print "#{board[[row, col]]} "
        end
      end
      puts 
    end
  end

  def update
    until false
      system "clear"
      self.render
      self.cursor.get_input #changes cursor posn
      prev ||= nil
      cursor_pos = self.cursor.cursor_pos
      if (cursor.selected && prev == nil) && !(board[cursor_pos] == board.sentinel)   #picking up a piece
        prev = cursor_pos
      elsif !cursor.selected && prev != nil       #dropping a piece
        if cursor_pos == prev
          prev = nil
        else
          #board.valid_pos will do a check if it fails just set prev to nil 
          board.move_piece(prev, cursor_pos)
          prev = nil
        end
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  

  b = Board.new
  b.move_piece([0, 1], [3, 1])
  puts "HHHHHHHHELLLOOO"
  p b[[0, 0]].symbol

  p b[[0, 0]].moves
  # sleep(1111)
  d = Display.new(b)
  d.render
  sleep(2)
  
  d.render
end