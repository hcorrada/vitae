require 'pp'

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
      cite = x['cite']
      if x.has_key? 'inprep'
        return "*In preparation*"
      end

      citation = "*#{cite['journal']}*"
      if x.has_key? 'published'
        citation += " #{cite['volume']}"
      elsif x.has_key? 'inpress'
        citation += ", *in press*"
      elsif x.has_key? 'submitted'
        citation += ", *submitted*"
      elsif x.has_key? 'inrevision'
        citation += ", *revising to resubmit*"
      elsif x.has_key? 'revision_submitted'
        citation += ", *revision submitted*"
      end

      if cite.has_key? 'doi'
        citation += ", doi:#{cite['doi']}"
      end

      return citation
    end

    def build_proceeding_cite(x)
      cite = x['cite']
      citation = "*#{cite['conference']}*"
      if x.has_key? 'published'
        citation += "#{cite['pages']}"
      elsif x.has_key? 'inpress'
        citation += ", *in press*"
      elsif x.has_key? 'submitted'
        citation += ", *under review*"
      elsif x.has_key? 'inrevision'
        citation += ", *in revision*"
      elsif x.has_key? 'revision_submitted'
        citation += ", *revision under review*"
      end

      return citation
    end

    def decorate_proceeding(x)
      x['authors'] = (x['authors'].map { |x| decorate_author x }).join(", ")
      x['cite'] = build_proceeding_cite x
      return x
    end

    def decorate_article(x)
      x['authors'] = (x['authors'].map { |x| decorate_author x }).join(", ")
      x['cite'] = build_citation x
      return x
    end

    def articles_fiveyears(db)
      arts = db.select "research/publications/articles :published <5 +year"
      puts arts
      arts = arts.map { |x| decorate_article x }
      return { "annotated_articles" => arts }
    end

    def selected_articles(db)
      arts = db.select "research/publications/articles :selected +year"
      arts = arts.map { |x| decorate_article x }
      return { "annotated_articles" => arts }
    end

    def articles_published(db)
      arts = db.select "research/publications/articles :published +year"
      arts = arts.map { |x| decorate_article x }
      return { "annotated_articles" => arts }
    end

    def articles_inpress(db)
      arts = db.select "research/publications/articles :inpress +year"
      arts = arts.map { |x| decorate_article x }
      return { "annotated_articles" => arts }
    end

    def articles_inprep(db)
      arts = db.select "research/publications/articles :inprep"
      arts = arts.map { |x| decorate_article x }
      return { "unpublished_articles" => arts }
    end

    def articles_submitted(db)
      arts = db.select "research/publications/articles :submitted"
      arts = arts.map { |x| decorate_article x }
      return { "unpublished_articles" => arts }
    end

    def articles_inrevision(db)
      arts = db.select "research/publications/articles :inrevision"
      arts = arts.map { |x| decorate_article x }
      return { "unpublished_articles" => arts }
    end

    def articles_revised(db)
      arts = db.select "research/publications/articles :revision_submitted"
      arts = arts.map { |x| decorate_article x }
      return { "unpublished_articles" => arts }
    end

    def refereed_proceedings(db)
      arts = db.select "research/publications/proceedings :published +year"
      arts = arts.map { |x| decorate_proceeding x }
      return { "annotated_articles" => arts }
    end

    def refereed_proceedings_fiveyears(db)
      arts = db.select "research/publications/proceedings :published <5 +year"
      arts = arts.map { |x| decorate_proceeding x }
      return { "annotated_articles" => arts }
    end

    def inpress_proceedings(db)
      arts = db.select "research/publications/proceedings :inpress"
      arts = arts.map { |x| decorate_proceeding x }
      return { "annotated_articles" => arts }
    end

    def proceedings_submitted(db)
      arts = db.select "research/publications/proceedings :submitted"
      arts = arts.map { |x| decorate_proceeding x }
      return { "unpublished_articles" => arts }
    end

    def proceedings_inrevision(db)
      arts = db.select "research/publications/proceedings :inrevision"
      arts = arts.map { |x| decorate_proceeding x }
      return { "unpublished_articles" => arts }
    end

    def proceedings_revised(db)
      arts = db.select "research/publications/proceedings :revision_submitted"
      arts = arts.map { |x| decorate_proceeding x }
      return { "unpublished_articles" => arts }
    end

    def build_preprint_cite(x)
      cite = x['cite']
      citation = "*#{cite['archive']}*"
      if x.has_key? 'published'
        citation += " #{cite['number']}"
      end
      if cite.has_key? 'url'
        citation += ". #{cite['url']}"
      end
      return citation
    end

    def decorate_preprint(x)
      x['authors'] = (x['authors'].map { |x| decorate_author x }).join(", ")
      x['cite'] = build_preprint_cite x
      return x
    end

    def preprints(db)
      records = db.select "research/publications/preprints :published +year"
      records = records.map { |x| decorate_preprint x }
      return { "annotated_articles" => records }
    end

    def preprints_fiveyears(db)
      arts = db.select "research/publications/preprints :published <5 +year"
      puts arts
      arts = arts.map { |x| decorate_preprint x }
      return { "annotated_articles" => arts }
    end
  end
end
