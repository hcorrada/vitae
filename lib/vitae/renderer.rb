require 'liquid'

module Vitae
  class Renderer

    def run(str, db)
      template = Liquid::Template.parse(str)
      result = template.render(db)
      return result
    end
  end
end
