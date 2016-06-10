class Game
  attr_reader :board, :snake
  def initialize
    @board = Board.new
    @snake = Snake.new
  end
end
