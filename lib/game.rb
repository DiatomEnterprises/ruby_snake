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
    @snake.size.times do |snake_body_part|
      case snake.direction

      when :left
        gameboard.board[snake.position.first][snake.position.last + snake.size + 1] = '.'
        gameboard.board[snake.position.first][snake.position.last + snake_body_part] = 'x'
      when :right
        gameboard.board[snake.position.first][snake.position.last - snake.size - 1] = '.'
        gameboard.board[snake.position.first][snake.position.last - snake_body_part] = 'x'
      when :up
        gameboard.board[snake.position.first - snake.size - 1][snake.position.last] = '.'
        gameboard.board[snake.position.first - snake_body_part][snake.position.last] = 'x'
      when :down
        gameboard.board[snake.position.first + snake.size + 1][snake.position.last] = '.'
        gameboard.board[snake.position.first + snake_body_part][snake.position.last] = 'x'
      end
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
      snake.step
    end
  end
end
