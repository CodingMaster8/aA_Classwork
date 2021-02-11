require_relative "Piece"

class Pawn < Piece
  def symbol
    "♙".colorize(self.color)
  end

  def moves
    all_moves = []
    x = self.pos[0]
    y = self.pos[1]

    forward_steps.each do |step|
      x += step[0]
      y += step[1]
      next_pos = [x,y]
      current_square = board[next_pos]

      if (x <= 7 && x >= 0) && (y <= 7 && y >= 0) && current_square.color.nil?
        all_moves << next_pos
      end

      x = self.pos[0]
      y = self.pos[1]
    end

    side_attacks.each do |step|
      x += step[0]
      y += step[1]
      next_pos = [x,y]
      current_square = board[next_pos]

      if (x <= 7 && x >= 0) && (y <= 7 && y >= 0)
        if current_square.color != self.color && current_square.color != nil
          all_moves << next_pos
        end
      end

      x = self.pos[0]
      y = self.pos[1]
    end

    all_moves
  end

  private
  def at_start_row?
    self.pos[0] == 1
  end

  def forward_dir
    [1,0]
  end

  def forward_steps
    if at_start_row?
      [[1,0], [2,0]]
    else
      [[1,0]]
    end
  end

  def side_attacks
    [[1,1], [1,-1]]
  end
end