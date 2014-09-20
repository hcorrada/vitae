module Vitae
  class Processor
    def invited_talks(db)
      presentations = db.select "research/presentations/talks :invited +year"
      return { "presentations" => presentations }
    end

    def refereed_presentations(db)
      presentations = db.select "research/presentations/conferences :refereed +year"
      return { "presentations" => presentations }
    end
  end
end
