class Site < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :nations, through: :reports

  validates :code, uniqueness: true
end
