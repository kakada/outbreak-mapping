class Report < ApplicationRecord
  has_many :report_details, dependent: :destroy

  validates :location_code, presence: true
  validates :location_code, uniqueness: true
  validates :total_cases, numericality: { greater_than_or_equal_to: 0 }
  validates :new_cases, numericality: { greater_than_or_equal_to: 0 }
end
