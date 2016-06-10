class Board
  attr_reader :length, :width
  attr_accessor :board

  def initialize(length: 50, width: 50)
    @length = length
    @width = width
    @board = create_board
  end

  def create_board
    Array.new(length){ Array.new(width, '.') }
  end

end
