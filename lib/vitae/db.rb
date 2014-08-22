module Vitae
  class DB
    attr_accessor :data
    def initialize(dbpath)
      @path = dbpath
      @data = load_db(dbpath)
    end

    def load_db(path)
      return {name: 'Hector'}
    end
  end
end
