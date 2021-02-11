module Stepable

  def moves
    all_moves = []

    x = self.pos[0]
    y = self.pos[1]

    move_diffs.each do |diff|
      x += diff[0]
      y += diff[1]
      next_pos = [x, y] 
      current_square = board[next_pos]

      if (x <= 7 && x >= 0) && (y <= 7 && y >= 0) && current_square.color != self.color
          all_moves << next_pos
      end

      x = self.pos[0]
      y = self.pos[1]
    end
    all_moves
  end

end
