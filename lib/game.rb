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

  def print_snake

  end

  def show
    @snake.size.times do |snake_body_part|
      case snake.direction

      when :left
        gameboard.board[snake.position.first][snake.position.last + snake_body_part] = 'x'
      when :right
        gameboard.board[snake.position.first][snake.position.last - snake_body_part] = 'x'
      when :up
        gameboard.board[snake.position.first - snake_body_part][snake.position.last] = 'x'
      when :down
        gameboard.board[snake.position.first + snake_body_part][snake.position.last] = 'x'
      end
    end
    print_board
  end
end
