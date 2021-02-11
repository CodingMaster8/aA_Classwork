require_relative "Rook"
require_relative "NullPiece"
require_relative "Queen"
require_relative "Bishop"
require_relative "Knight"
require_relative "King"
require_relative "Pawn"
require "colorize"

class Board
  attr_accessor :rows
  def initialize
    @null_piece = NullPiece.instance
    @rows = Array.new(8) {Array.new(8, @null_piece)}

    @rows.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if i == 1  
          @rows[i][j] = Pawn.new(:red, self, [i, j])
        elsif i == 6
          @rows[i][j] = Pawn.new(:blue, self, [i, j])
        elsif i == 0 && (j == 0 || j == 7)
          @rows[i][j] = Rook.new(:red, self, [i, j])
        elsif i == 7 && (j == 0 || j == 7)
          @rows[i][j] = Rook.new(:blue, self, [i, j])
        elsif i == 0 && (j == 1 || j == 6)
          @rows[i][j] = Knight.new(:red, self, [i, j])
        elsif i == 7 && (j == 1 || j == 6)
          @rows[i][j] = Knight.new(:blue, self, [i, j])
        elsif i == 0 && (j == 2 || j == 5)
          @rows[i][j] = Bishop.new(:red, self, [i, j])
        elsif i == 7 && (j == 2 || j == 5)
          @rows[i][j] = Bishop.new(:blue, self, [i, j])
        elsif i == 0 && j == 3
          @rows[i][j] = Queen.new(:red, self, [i, j])
        elsif i == 7 && j == 3
          @rows[i][j] = Queen.new(:blue, self, [i, j])
        elsif i == 0 && j == 4
          @rows[i][j] = King.new(:red, self, [i, j])
        elsif i == 7 && j == 4
          @rows[i][j] = King.new(:blue, self, [i, j])
        end
      end
    end
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def valid_pos?(pos)
    x, y = pos
    if !(0..7).include?(x) || !(0..7).include?(y)
      raise ArgumentError.new "Invalid position"
    end
  end

  
  def move_piece(color, start_pos, end_pos)
    x, y = end_pos
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new "There is no piece at starting position!"
    elsif !(0..7).include?(x) || !(0..7).include?(y)
      raise ArgumentError.new "The piece cannot move to end position!"
    elsif self[end_pos].color == color
      raise ArgumentError.new "Our piece is there...?"
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end
end

board = Board.new

# rook = Rook.new("w", board, [0,0])
# queen = Queen.new("w", board, [3,3])
# bishop = Bishop.new("w", board, [3,3])
# knight = Knight.new("w", board, [3,3])
# king = King.new("w", board, [3, 3])
# bad_pawn = Pawn.new("w", board, [2,2])
# board[[2,2]] = bad_pawn

# pawn = Pawn.new("w", board, [1,1])
# board[[1,1]] = pawn

# p board.move_piece("w", [1,1], [8,2])
# # p pawn.moves