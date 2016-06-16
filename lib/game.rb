require 'io/console'
class Game
  attr_reader :gameboard, :snake
  def initialize
    @gameboard = Board.new
    @snake = Snake.new
  end

  def print_board
    system('clear')
    @gameboard.board.each do
      |line| puts line.each{|item| item}.join(" ")
    end
  end

  def show
    @gameboard.create_board
    @snake.parts.each do |part|
      @gameboard.board[part.first][part.last] = 'x'
    end
    print_board
  end

  def start
    tick
  end


  def tick
    while true
      show
      sleep(0.1)
      key = GetKey.getkey
      puts key
      @snake.turn(key) if key
      @snake.step
      @snake.check_position(@gameboard.length, @gameboard.width)
    end
  end
end
