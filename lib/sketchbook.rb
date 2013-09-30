unless defined? SKETCHBOOK_ROOT
  $LOAD_PATH << File.expand_path(File.dirname(__FILE__))
  SKETCHBOOK_ROOT = File.expand_path(File.dirname(__FILE__) + "/../")
end

module Sketchbook
  autoload :Runner, 'sketchbook/runner'
end
