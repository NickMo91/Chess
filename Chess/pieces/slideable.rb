require "byebug"
module Slideable
  HORIZONTAL_DIRS = []
  DIAGONAL_DIRS = []

  def horizontal_dirs
  end

  def diagonal_dirs
  end

  def moves #uses move_dirs
    # debugger
    poss_moves = []
    self.move_dirs.each {|dir| poss_moves += self.grow_unblocked_moves_in_dir(dir)}
    poss_moves
  end

  def move_dirs #overridden
  end
  
  def grow_unblocked_moves_in_dir(dir)
    #IN: [0, 1]
    result = []
    x, y = dir
    new_x = self.pos[0]
    new_y = self.pos[1]
    while (0..7).include?(new_x) && (0..7).include?(new_y)
      result << [new_x, new_y]
      new_x += dir[0] #-1 0 1
      new_y += dir[1] #-1 0 1
      
    end
    result
  end
end