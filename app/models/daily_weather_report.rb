class DailyWeatherReport < ApplicationRecord
  belongs_to :patch
  validates :date
  validates :description
  validates :temperature
end
