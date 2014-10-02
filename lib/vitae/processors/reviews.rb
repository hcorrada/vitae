module Vitae
  class Processor
    def journal_reviews(db)
      entries = db.select "service/review/reviewer :journal"
      entries = entries.map { |x| {"entry" => x['journal'] } }
      return { "reviews" => entries }
    end

    def panel_reviews(db)
      entries = db.select "service/review/reviewer :panel"
      entries = entries.map { |x| {"entry" => x['panel'] }}
      return { "reviews" => entries }
    end

    def conference_reviews(db)
      entries = db.select "service/review/reviewer :conference"
      entries = entries.map { |x| {"entry" => x['conference'] }}
      return { "reviews" => entries }
    end
  end
end
