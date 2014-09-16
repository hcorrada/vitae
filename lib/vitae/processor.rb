module Vitae
  class Processor
    def initialize(sections, template_dir='templates', template_extension='.md')
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
      return section_content
    end

    def contact(db)
      out = db.select "personal/contact"
      out['academic_address'] = out['academic_address'].gsub "\n", "  \n"
      return out
    end

    def english_list(a)
      if not a.kind_of?(Array)
        return a
      end

      return "#{a[0...-1].join(",")} and #{a.last}"
    end

    def degrees(db)
      out = db.select "personal/education"
      out.map! do |item|
           if item.has_key? 'advisor' 
             item['advisor'] = english_list item['advisor']
           end
           item
         end
      pp out
      return { "degrees" => out }
    end
  end
end
