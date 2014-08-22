require 'mustache'

module Vitae
  class Renderer

    def run(str, db)
      result = Mustache.render(str, db)
      return result
    end
  end
end
