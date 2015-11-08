require 'pp'

module Vitae
  class Processor
    def filter_completed(grant)
      return true if grant.has_key? "submitted"
      return false unless grant.has_key? "funded"

      date = Date.parse grant['dates'].split('-')[1] rescue nil
      return false if date.nil?

      return (date > Date.today)
    end

    def decorate_grant(grant)
      kind = "Completed"
      kind = "Pending" if grant.has_key? "submitted"
      kind = "Current" if grant.has_key? "funded"

      grant['kind'] = kind
      return grant
    end

    def current_and_pending(db)
      current_and_pending = db.select "research/funding/grants -declined"
      current_and_pending = current_and_pending.select { |x| filter_completed x }
      current_and_pending = current_and_pending.map { |x| decorate_grant x }
      return {"candp_grants" => current_and_pending}
    end

    def grant_addendum(db)
      grant_addendum = db.select "research/funding/grants :addendum"
      grant_addendum = grant_addendum.map { |x| decorate_grant x }
      return {"candp_grants" => grant_addendum }
    end
  end
end
