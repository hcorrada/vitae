require 'safe_yaml'
require 'pp'
require 'open3'

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
      content_sections = processor.run(@db)
      
      renderer = Vitae::Renderer.new
      output = renderer.run(@content, content_sections)
      
      @config['outfile'] ||= File.basename(@inputfile, File.extname(@inputfile)) + ".pdf"
      @config['outdir'] ||= 'output'
      @config['pandoc'] ||= {"command" => 'pandoc'}
      @config['pandoc']['command'] ||= 'pandoc'
      @config['pandoc']['title'] = @config['title'] || "Curriculum Vitae"
      write(output, File.join(@config['outdir'], @config['outfile']), @config['pandoc'])
    end

    def write(str, outfile, pandoc_config)
      command = pandoc_config['command'] ||= 'pandoc'
      pandoc_config.delete 'command'
      content = pandoc_config.to_yaml + "---\n" + str
      puts content

      command += " -o #{outfile}"
      puts command
      Open3::popen3(command) do |stdin, stdout, stderr|
        stdin.puts content
        stdin.close
        STDERR.print stderr.read
      end
    end
  end
end  
