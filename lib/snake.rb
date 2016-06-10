class Snake
  attr_reader :size, :direction, :position
  def initialize
    @size = 4
    @direction = :right
    set_start_position
  end

  def set_start_position
    @position = [Random.rand(0..25), Random.rand(0..25)]
  end

  def step
    case direction
    when :left
      position[1] -= 1
    when :right
      position[1] += 1
    when :up
      position[0] -= 1
    when :down
      position[0] += 1
    end
  end
end
