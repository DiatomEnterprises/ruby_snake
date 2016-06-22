require 'io/console'
class Game
  attr_reader :gameboard, :snake, :food
  def initialize(max_x=11, max_y=11)
    @gameboard = Board.new(max_x, max_y)
    @snake = Snake.new(@gameboard.width, @gameboard.length)
    @food = Food.new(@gameboard.width, @gameboard.length)
  end

  def print_board
    system('clear')
    puts "Snake head: "+@snake.parts.first.inspect + " Food: " + @food.x.to_s + ":" + @food.y.to_s + " gameboard: "+ @gameboard.width.to_s+":"+ @gameboard.length.to_s
    @gameboard.board.each do
      |line| puts line.each{|item| item}.join(" ")
    end
  end

  def show
    @gameboard.create_board
    @gameboard.board[@food.x][@food.y] = 'o'
    @snake.parts.each do |part|
      @gameboard.board[part.first][part.last] = 'x'
    end
    print_board
  end

  def show_message(text)
    @gameboard.create_board
    @gameboard.print_text(text)
    print_board
  end

  def show_start_screen
    start = false
    while start == false
      show_message("[S]tart")
      key = GetKey.getkey
      sleep(0.5)
      if key && (key.chr == "S" || "s")
        start = true
      end
    end
  end

  def check_snake_position
    check_snake_met_wall
    check_snake_ate_food
    check_snake_ate_itself
  end

  def check_snake_ate_itself
    #change to snake.body
    body = snake.parts[1..snake.parts.length-1]
    if body.include? @snake.parts.first
      raise MetWallError
    end
  end

  def check_snake_met_wall
    # value - 1 because it's an array from 0..width
    @snake.update_head(1,0) if @snake.parts.first[1] > @gameboard.width-1
    @snake.update_head(1, @gameboard.width-1) if @snake.parts.first[1] < 0
    @snake.update_head(0, 0) if @snake.parts.first[0]  > @gameboard.length-1
    @snake.update_head(0, @gameboard.length-1) if @snake.parts.first[0] < 0
  end

  def check_snake_ate_food
    if @snake.parts.first[0] == @food.x && @snake.parts.first[1] == @food.y
      @snake.increase
      @food = Food.new(@gameboard.width, @gameboard.length)
    end
  end

  def start
    show_start_screen
    begin
      tick
    rescue MetWallError
      show_message("Game over")
    else
      super
    end
  end


  def tick
    while true
      show
      sleep(0.1)
      key = GetKey.getkey
      puts key
      @snake.turn(key) if key
      @snake.step
      check_snake_position
    end
  end
end
