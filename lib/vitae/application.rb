module Vitae
  class Application
    def initialize(inputfile)
      @inputfile = inputfile
      @config, @content = parse_input(@inputfile)
      pp @config

      @config['db_path'] ||= 'data'
      @db = Vitae::DB.new(@config['db_path'])
    end

    def parse_input(file)
      return [Hash.new, 'This is a test']
    end

    def run()
      output = render()
      
      @config['outfile'] ||= 'out.pdf'
      @config['tmpdir'] ||= './tmp'
      @config['pandoc'] ||= {command: 'pandoc'}
      write(output, @config['outfile'], @config['tmpdir'], @config['pandoc'])
    end

    def render()
      puts @content
    end

    def write(str, outfile, tmpdir, pandoc_config)
      puts 'write'
    end
  end
end  
