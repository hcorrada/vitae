require 'safe_yaml'
require 'pp'

module Vitae
  class Application
    def initialize(inputfile)
      @inputfile = inputfile
      @config, @content = parse_input()
      @config['db_path'] ||= 'db'
      @db = Vitae::DB.new(@config['db_path'])
    end

    def parse_input()
      begin
        content = File.read(@inputfile)
        if content =~ /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
          content = $'
          config = SafeYAML.load($1)
        end

      rescue SyntaxError => e
        print "YAML exception reading #{@inputfile}: #{e.message}"
      rescue Exception => e
        print "Error reading file #{@inputfile}: #{e.message}"
      end

      config ||= {}
      return [config, content]
    end

    def run()
      processor = Vitae::Processor.new(@config['sections'])
      content_sections = processor.run(@db.data)
      
      renderer = Vitae::Renderer.new
      output = renderer.run(@content, content_sections)
      
      @config['outfile'] ||= 'out.pdf'
      @config['tmpdir'] ||= './tmp'
      @config['pandoc'] ||= {command: 'pandoc'}
      write(output, @config['outfile'], @config['tmpdir'], @config['pandoc'])
    end

    def render(str)
      return str
    end

    def write(str, outfile, tmpdir, pandoc_config)
      puts str
    end
  end
end  
