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
      print "Config read\n"

      content_sections = processor.run(@db)
      print "Processing Done\n"

      renderer = Vitae::Renderer.new
      output = renderer.run(@content, content_sections)
      print "Rendering Done\n"

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

      options = pandoc_config['options'] ||= ""
      pandoc_config.delete 'options'

      content = pandoc_config.to_yaml + "---\n" + str
      puts content

      command += " #{options} -o #{outfile}"
      puts command
      Open3::popen3(command) do |stdin, stdout, stderr|
        stdin.puts content
        stdin.close
        STDERR.print stderr.read
      end
    end

    def query(str)
      records = @db.select str rescue nil
      pp records
    end
  end
end  
