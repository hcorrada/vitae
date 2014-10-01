module Vitae
  class Processor
    def decorate_student(name, x)
      x['name'] = name
      x['stage'] = x['level'].first[1].capitalize
      if x['level'].has_key? 'placement'
        x['stage'] += "\\\n#{x['level']['placement']}"
      end
      return x
    end
    
    def advising_doctoral(db)
      students = db.select 'teaching/advising'
      out = students.select { |key, x| x['level'].has_key? 'doctoral' and (x['role'] == 'advisor' or x['role'] == 'co-advisor') }
      out = out.merge students.select{ |key, x| x['level'].has_key? 'doctoral' and x['role'] != 'advisor' and x['role'] != 'co-advisor' }
      out = out.map { |key, x| decorate_student key, x }
      return { "advising" => out }
    end

    def advising_undergrad(db)
      students = db.select 'teaching/advising'
      out = students.select { |key, x| x['level'].has_key? 'undergrad' }
      out = out.map { |key, x| decorate_student key, x }
      return { "advising" => out }
    end
  end
end
