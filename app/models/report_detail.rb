class ReportDetail < ApplicationRecord
  attr_accessor :location_code
  belongs_to :report

  validates :field_name, :field_value, presence: true
  validates :display_order, numericality: { greater_than: 0 }

  before_validation :ensure_reports

  def ensure_reports
    begin
      self.report = Report.find_by(location_code: location_code)
    rescue Exception => e
      logger.log("#{location_code}: #{e.inspect}")
    end
  end
end
