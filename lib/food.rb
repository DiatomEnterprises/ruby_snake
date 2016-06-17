class Food
  attr_reader :x, :y

  def initialize(board_max_x = 50, board_max_y = 50)
    @x = Random.rand(board_max_x)
    @y = Random.rand(board_max_y)
  end


end
