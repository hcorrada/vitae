require 'safe_yaml'

module Vitae
  class DB
    attr_accessor :data
    def initialize(dbpath)
      @path = dbpath
      @data = {}
      load_db(@path)
    end

    def load_db(path)
      read_data_to(path, self.data)
    end

    def read_data_to(path, data)
      return unless File.directory?(path)
      
      entries = Dir.chdir(path) do
                  Dir['*.{yaml, yml, json}'] + Dir['*'].select { |fn| File.directory?(fn) }
                end

      entries.each do |entry|
               entry_path = File.join(path, entry)
               key = File.basename(entry_path, File.extname(entry_path))

               if File.directory?(entry_path)
                 read_data_to(entry_path, data[key] = {})
               else
                 data[key] = SafeYAML.load_file(entry_path)
               end
             end
    end

    def select(query)
      res = @data
      path_array = query.split "/"
      path_array.each do |key|
                  return {} if not res.has_key? key
                  res = res[key] 
                end
      return res
    end
  end
end
