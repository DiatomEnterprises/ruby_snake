Dir[File.expand_path('lib/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

game = Game.new
puts game.snake.direction
puts game.snake.position.inspect
game.start
