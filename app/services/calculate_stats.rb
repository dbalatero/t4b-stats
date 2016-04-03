class CalculateStats
  attr_reader :upload_date

  def initialize(upload_date: Date.today)
    @upload_date = upload_date
  end

  def self.run(*args)
    new(*args).run
  end

  def run
    totals_by_state.merge \
      overall_totals: totals_for(assignments)
  end

  private

  def totals_by_state
    by_state = assignments.group_by(&:state).map do |state, records|
      [state, totals_for(records)]
    end

    Hash[by_state]
  end

  def totals_for(assignments_subset)
    status_totals = assignments_subset.group_by(&:status).map do |status, records|
      [status, records.map(&:supporters).sum]
    end

    Hash[status_totals].merge \
      total_supporters: assignments_subset.map(&:supporters).sum
  end

  def assignments
    @assignments ||= Assignment.where(upload_date: upload_date)
  end
end
