module Vitae
  class Processor
    def initialize(sections, template_dir='templates', template_extension='.markdown')
      @sections = sections || {"contact_info" => {"template" => 'contact', "filter" => 'contact'}}
      @template_dir = template_dir 
      @template_extension = template_extension
    end

    def load_template(name)
      path = File.join(@template_dir, name + @template_extension)
      return File.read(path) rescue ""
    end

    def run(db)
      renderer = Vitae::Renderer.new
      section_content = {}
      @sections.each_pair do |key, section|
                 template = self.load_template section['template']
                 context = self.send(section['filter'], db) rescue {}
                 section_content[key] = renderer.run(template, context)
               end
      pp section_content
      return section_content
    end

    def contact(db)
      return db['personal']['contact']
    end
  end
end
