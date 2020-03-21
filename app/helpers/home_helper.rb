# frozen_string_literal: true

module HomeHelper
  def active_cases(report)
    report.total_cases - report.recovered_cases - report.death_cases
  end
end
