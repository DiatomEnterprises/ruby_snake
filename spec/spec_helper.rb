Dir[File.expand_path('../lib/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end
Dir[File.expand_path('../lib/errors/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end
RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
