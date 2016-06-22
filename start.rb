Dir[File.expand_path('lib/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end
Dir[File.expand_path('lib/errors/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

game = Game.new
game.start
