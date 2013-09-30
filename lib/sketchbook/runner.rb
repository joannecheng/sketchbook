require 'ostruct'
require 'fileutils'

module Sketchbook

  class Runner
    def self.execute
      runner = new
      runner.parse_options(ARGV)
      runner.execute!
    end

    def execute!
      create(@options.path, @options.args)
    end

    def parse_options(args)
      @options = OpenStruct.new
      @options.action = args[0] || nil
      @options.path = args[1] || File.basename(Dir.pwd + '.rb')
      @options.args = args[2..-1] || []
    end

    def create(sketch_name, args)
      puts "Created new sketch at #{sketch_name}.rb"
    end
  end
end
