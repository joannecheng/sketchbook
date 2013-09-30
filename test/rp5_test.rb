require "minitest/autorun"

Dir.chdir(File.dirname(__FILE__))

class Rp5Test < MiniTest::Unit::TestCase
  def test_create
    output = `../bin/sketchbook create new_sketch`
    assert_equal output, "Created new sketch at new_sketch.rb\n"
    `rm ../test/new_sketch.rb`
  end
end
