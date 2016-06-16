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

  def check_position(max_length, max_width)
    @parts.first[1] = 0 if position[1] > max_width
    @parts.first[1] = max_width if position[1] < 0
    @parts.first[0] = 0 if position[0] > max_length
    @parts.first[0] = max_length if position[0] < 0
  end

  def turn(key_code)
    @direction = case key_code
    when 'w' || 'W'
      :up
    when 's' || 'S'
      :down
    when 'a' || 'A'
      :left
    when 'd' || 'D'
      :right
    end
    # when 91 up
    # when 66 down
    #27 right
    #68 left
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
    #change unshift, it causes index with minus
    @parts.pop #remove last
  end
end
