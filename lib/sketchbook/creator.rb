require 'fileutils'
require 'erb'

module Sketchbook
  class Creator
    def create!(sketch_name, args)
      sketch_file = File.join("#{sketch_name.underscore}.rb")
      if File.exists?(sketch_file)
        puts "That sketch already exists."
        exit
      end

      @name = sketch_file.camelize
      @file_name = sketch_file.underscore
      @title = sketch_file.titleize

      template_name = 'blank_sketch.rb.erb'
      template = File.new("#{SKETCHBOOK_ROOT}/lib/templates/create/blank_sketch.rb.erb")
      rendered = render_erb_from_string_with_binding(template.read, binding)
      full_path = File.join(Dir.pwd, "#{@file_name}.rb")
      File.open(full_path, 'w').write(rendered)

      puts "Created new sketch at #{sketch_name}.rb"
    end

    def render_erb_from_string_with_binding(erb, given_binding)
      rendered = ERB.new(erb, nil, '<>', 'rendered').result(given_binding)
    end
  end
end
