module Vitae
  class DB
    def initialize(dbpath)
      @path = dbpath
      @data = load_db(dbpath)
    end

    def load_db(path)
      puts 'load_db'
    end
  end
end
