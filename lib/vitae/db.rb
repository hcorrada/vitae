module Vitae
  class DB
    attr_accessor :data
    def initialize(dbpath)
      @path = dbpath
      @data = load_db(@path)
    end

    def load_db(path)
      read_data_to(path, @data)
    end

    def read_data_to(path, data)
      return unless File.directory?(path)
      
      entries = Dir.chdir(path) do
                  Dir['*.{yaml, yml, json}'] + Dir['*'].select { |fn| File.directory?(fn) }
                end

      entries.each do |entry|
               entry_path = File.join(path, entry)
               key = File.basename(entry_path)
               if File.directory?(entry_path)
                 read_data_to(entry_path, data[key] = {})
               else
                 data[key] = SafeYaml.load_file(entry_path)
               end
             end        
    end
end
