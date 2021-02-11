require_relative "stepable"
require_relative "Piece"

class King < Piece
  include Stepable
  
  def symbol
    "♔".colorize(self.color)
  end

  protected
  def move_diffs
    [[-1,0], [1,0], [0,1], [0,-1], [-1,1], [-1,-1], [1,-1], [1,1]]
  end
end