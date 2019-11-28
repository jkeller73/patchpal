class DailyWeatherReport < ApplicationRecord
  belongs_to :patch
  validates :date, presence: true
  validates :description, presence: true
  validates :temperature, presence: true
end
