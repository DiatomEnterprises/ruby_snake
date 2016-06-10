class Board
  attr_reader :board, :length, :width

  def initialize(length: 300, width: 300)
    @length = length
    @width = width
    @board = create_board
  end

  def create_board
    Array.new(length, Array.new(width, '.'))
  end

end
