require 'safe_yaml'
require 'pp'

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
      select = /^(\S+)/.match(query)[1] rescue nil
      filter = /:(\S+)/.match(query)[1] rescue nil
      sort = /\+(\S+)/.match(query)[1] rescue nil

      return {} if select.nil?
      
      items = @data
      path_array = select.split "/"
      path_array.each do |key|
                  items = items.has_key?(key) ? items[key] : {}
                end
      if not filter.nil?
        items = items.select { |x| x.has_key? filter }
      end

      if not sort.nil?
        items = items.sort { |x,y| y[sort] <=> x[sort] }
      end

      return items
    end
  end
end
