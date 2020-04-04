# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :report_details, dependent: :destroy

  validates :location_code, presence: true
  validates :location_code, uniqueness: true
  validates :total_cases, numericality: { greater_than_or_equal_to: 0 }
  validates :new_cases, numericality: { greater_than_or_equal_to: 0 }
  validates :new_recovered_case, numericality: { greater_than_or_equal_to: 0 }
  validates :new_death_case, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :location, class_name: "Location", foreign_key: "location_code"
end
