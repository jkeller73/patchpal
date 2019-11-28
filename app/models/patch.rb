require 'open-uri'

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
  has_many :weather_alerts, dependent: :destroy

  def update_weather
    forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=#{longitude}&lon=#{latitude}&APPID=#{ENV['WEATHER_API_KEY']}").read)
    days_array = forecast['list']
    @description = days_array[0]['weather'][0]['description']
    @temperature = (days_array[0]['main']['temp'] - 273.15).round
    DailyWeatherReport.create(date: Time.now, description: @description, temperature: @temperature, patch: self)
  end

  def check_weather
    @days = daily_weather_reports.last(3)
    day_weather = []
    @days.each do |day|
      day_weather << day.description
    end

    if weather_alerts.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).empty?
      if day_weather.all? != /\w+?|rain|\w+?/
        WeatherAlert.create(type_of_alert: 'water', message: 'You should water your plants', patch: self)
      else
        puts 'it has rained'
      end
    end
  end
end
