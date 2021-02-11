require_relative "Piece"
require_relative "stepable"

class Knight < Piece
  include Stepable
  
  def symbol
    "♘".colorize(self.color)
  end

  protected
  def move_diffs
    [[1,2], [2,1], [-1,2], [1,-2], [-2,1], [2,-1], [-1,-2], [-2,-1]]
  end
end
