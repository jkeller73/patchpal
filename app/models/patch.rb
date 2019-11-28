require 'open-uri'

class Patch < ApplicationRecord
  belongs_to :user
  has_many :patch_plants, dependent: :destroy
  has_many :plants, through: :patch_plant
  has_many :daily_weather_reports
  has_many :alerts, through: :patch_plants
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def update_weather
    forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=#{longitude}&lon=#{latitude}&APPID=#{ENV['WEATHER_API_KEY']}").read)
    days_array = forecast['list']
    @description = days_array[0]['weather'][0]['description']
    @temperature = (days_array[0]['main']['temp'] - 273.15).round
    DailyWeatherReport.create(date: Time.now, description: @description, temperature: @temperature, patch: self)
  end
end
