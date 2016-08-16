class Food
  attr_reader :x, :y

  def initialize(board_max_x, board_max_y)
    @x = Random.rand(board_max_x)
    @y = Random.rand(board_max_y)
  end

  def coordinates
    [x,y]
  end


end
