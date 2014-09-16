module Vitae
  class Processor
    def decorate_author(x)
      name = x.keys.first
      if x[name].nil?
        return name
      end

      annotation = x[name]

      if annotation.has_key? 'me'
        name = "**#{name}**"
      end

      if annotation.has_key? 'lead'
        name = "#{name}\\textasciicircum"
      end

      if annotation.has_key? 'corresponding'
        name = "#{name}\\*"
      end

      if annotation.has_key? 'advised'
        name = "#{name}\\textsuperscript{\\#}"
      end
      
      return name
    end

    def build_citation(x)
      citation = "*#{x['cite']['journal']}*"
      if x.has_key? 'published'
        citation += " #{x['cite']['volume']}"
      elsif x.has_key? 'inpress'
        citation += ", *in press*"
      end

      if x['cite'].has_key? 'doi'
        citation += ", doi:#{x['cite']['doi']}"
      end

      return citation
    end

    def decorate_article(x)
      x['authors'] = (x['authors'].map { |x| decorate_author x }).join(", ")
      x['cite'] = build_citation x
      return x
    end

    def articles_published(db)
      arts = db.select "research/publications/articles :published +year"
      arts = arts.map { |x| decorate_article x }
      return { "articles" => arts }
    end

    def articles_inpress(db)
      arts = db.select "research/publications/articles :inpress +year"
      arts = arts.map { |x| decorate_article x }
      return { "articles" => arts }
    end
  end
end
