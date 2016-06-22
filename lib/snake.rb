require 'pry'
class Snake
  attr_reader :size, :direction, :position, :parts
  def initialize
    @size = 4
    @direction = :left
    @parts = []
    set_start_position
    create_snake
  end

  def create_snake
    size.times do |iteration|
      @parts << [position[0], position[1]+iteration]
    end
  end

  def set_start_position
    @position = [Random.rand(0..25), Random.rand(0..25)]
  end

  def increase
    @parts << position
  end

  def update_head(idx, value)
    @parts.first[idx] = value
  end

  def turn(key_code)
    @direction = case key_code.chr
    when 'w' || 'W'
      :up
    when 's' || 'S'
      :down
    when 'a' || 'A'
      :left
    when 'd' || 'D'
      :right
    else
      @direction
    end
  end

  def step
    new_head = [@parts.first.first,@parts.first.last]
    case direction
    when :left
      new_head[1] -= 1
    when :right
      new_head[1] += 1
    when :up
      new_head[0] -= 1
    when :down
      new_head[0] += 1
    end
    @parts.unshift(new_head) #add to head
    @parts.pop #remove last
  end
end
