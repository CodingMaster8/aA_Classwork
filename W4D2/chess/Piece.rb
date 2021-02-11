class Piece
  attr_accessor :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    symbol
  end

  def empty?
  end

  def pos=(val)
  end

  def symbol
  end

  private
  def move_into_check?(end_pos)
  end
end
