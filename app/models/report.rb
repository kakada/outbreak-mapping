class Report < ApplicationRecord
  belongs_to :site
  belongs_to :nation

  def self.sum_results
    pluck("sum(reports.cases), sum(reports.heals), sum(reports.deaths)")[0]
  end
end
