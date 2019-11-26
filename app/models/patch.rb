class Patch < ApplicationRecord
  belongs_to :user
  has_many :patch_plants, dependent: :destroy
  has_many :plants, through: :patch_plant
  has_many :daily_weather_reports
  validates :address, presence: true
end
