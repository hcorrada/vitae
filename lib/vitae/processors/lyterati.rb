module Vitae
  class Processor
    def umd_appointments(db)
      appts = db.select "personal/appointments/academic_appointments"
      return { "appointments" => appts.select { |x| x['institution'] =~ /Maryland/ } }
    end

    def notumd_appointments(db)
      appts = db.select "personal/appointments/academic_appointments"
      return { "appointments" => appts.select { |x| x['institution'] !~ /Maryland/ } }
    end

    def other_employment(db)
      return { "appointments" => db.select("personal/appointments/other_employment") }
    end
  end
end

