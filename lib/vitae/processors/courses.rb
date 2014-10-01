module Vitae
  class Processor
    def compare_courses(x,y)
      cmp = x['date']['year'].to_i <=> y['date']['year'].to_i
      if cmp != 0
        return cmp
      end

      cmp = x['date']['term'] <=> y['date']['term']
      if cmp != 0
        return x == 'Spring' ? -1 : 1
      end

      if x.has_key? 'classroom' 
        return y.has_key?('classroom') ? 0 : 1
      end

      return y.has_key?('classroom') ? -1 : 0
    end

    def decorate_course(x)
      description = x['description']
      if x.has_key? 'individual'
        description += " (Individual instruction)"
      end
      x['description'] = description
      x['description'] = x['description'].gsub "\n", " \\\n"
      
      x['term'] = "#{x['date']['term']} #{x['date']['year']}"
      return x
    end

    def courses_taught(db)
      courses = db.select "teaching/courses_taught"
      courses = courses.sort { |x,y| compare_courses x, y }
      courses = courses.reverse
      courses = courses.map { |x| decorate_course x }
      return { "courses" => courses }
    end

    def decorate_development(x)
      x['description'] = x['description'].gsub "\n", " "
      return x
    end

    def courses_developed(db)
      courses = db.select "teaching/development"
      courses = courses.map { |x| decorate_development x }
      return { "courses" => courses }
    end
  end
end
