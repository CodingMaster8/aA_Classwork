require_relative "Board"
require_relative "Cursor"
require "colorize"


class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    # i = 0
    # while i < 8

    #   puts @board[i]

    #   i += 1
    # end

    @board.rows.each do |row|
      puts row.join(" ")
    end
  end

end

board = Display.new(Board.new)

board.render