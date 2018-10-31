module Vitae
  class Processor
    def umd_appointments(db)
      appts = db.select "personal/appointments :academic"
      return { "appointments" => appts.select { |x| x['institution'] =~ /Maryland/ } }
    end

    def notumd_appointments(db)
      appts = db.select "personal/appointments :academic"
      return { "appointments" => appts.select { |x| x['institution'] !~ /Maryland/ } }
    end
  end
end

