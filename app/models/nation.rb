class Nation < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :sites, through: :reports

  validates :name, uniqueness: true
end
