class Patch < ApplicationRecord
  belongs_to :user
  has_many :patch_plants, dependent: :destroy
  has_many :plants, through: :patch_plants
  has_many :daily_weather_reports
  has_many :alerts, through: :patch_plants
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
