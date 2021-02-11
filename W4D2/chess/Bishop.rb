require_relative "slideable"
require_relative "Piece"

class Bishop < Piece
  include Slideable

  def symbol
    "♗".colorize(self.color)
  end

  private
  def move_dirs
    diagonal_dirs
  end
end
