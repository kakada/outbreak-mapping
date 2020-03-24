class ReportDetail < ApplicationRecord
  belongs_to :report

  validates :field_name, :field_value, presence: true
  validates :display_order, numericality: { greater_than: 0 }

  scope :nationalities, -> { where(field_name: "Nationality") }
end
