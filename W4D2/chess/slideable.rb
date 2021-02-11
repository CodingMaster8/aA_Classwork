module Slideable
  HORIZONTAL_DIRS = [[-1,0], [1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[-1,1], [-1,-1], [1,-1], [1,1]]

  def horizontal_dirs
    return HORIZONTAL_DIRS
  end

  def diagonal_dirs
    return DIAGONAL_DIRS
  end

  def moves
    all_moves = []

    move_dirs.each do |dir|
      dx, dy = dir
      all_moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    all_moves
    #call every element from move_dirs of each piece
    #pass each of that to grow_unblocked_moves_in_dir
  end

  private
  def grow_unblocked_moves_in_dir(drow, dcol)
    unblocked_moves = []
    x = self.pos[0]
    y = self.pos[1]
    
    x += drow
    y += dcol
    next_pos = [x, y]

    until (x > 7 || x < 0) || (y > 7 || y < 0)
      current_square = board[next_pos]
      #if it's an enemy piece
      if current_square.color != self.color && current_square.color != nil
        unblocked_moves << next_pos
        return unblocked_moves
      end

      #if it's our piece
      if board[next_pos].color == self.color
        return unblocked_moves
      end

      unblocked_moves << next_pos

      x += drow
      y += dcol
      next_pos = [x, y]
    end

    unblocked_moves
  end

end





