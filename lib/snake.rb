class Snake
  attr_reader :size, :direction, :position
  def initialize
    @size = 4
    @direction = :right
    set_start_position
  end

  def set_start_position
    @position = [Random.rand(0..100), Random.rand(0..100)]
  end
end
