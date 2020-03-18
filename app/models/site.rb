class Site < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :nations, through: :reports

  validates :code, uniqueness: true

  def self.sum_nations
    joins(:reports)
    .group("sites.id")
    .select("sites.*, sum(reports.cases) as num_cases, sum(reports.heals) as num_heals, sum(reports.deaths) as num_deaths")
  end
end
