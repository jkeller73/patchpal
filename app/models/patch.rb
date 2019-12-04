require 'open-uri'

class Patch < ApplicationRecord
  belongs_to :user
  has_many :patch_plants, dependent: :destroy
  has_many :plants, through: :patch_plants
  has_many :daily_weather_reports, dependent: :destroy
  has_many :alerts, through: :patch_plants
  validates :name, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :weather_alerts, dependent: :destroy

  def update_weather
    forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=#{latitude}&lon=#{longitude}&APPID=#{ENV['WEATHER_API_KEY']}").read)
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

  def week_forecast
    forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=#{latitude}&lon=#{longitude}&APPID=#{ENV['WEATHER_API_KEY']}").read)
    days_array = forecast['list']
    # good = [0, 8, 16, 24, 32, 39]
    # good = days_array.where()
    today = false
    days_array = days_array.map do |day|
      # [
      #   days_array[index]['weather'][0]['description'],
      #   (days_array[index]['main']['temp'] - 273.15).round
      # ]
      if Time.parse(day['dt_txt']).hour == 12
        {
          description: day['weather'][0]['description'],
          temperature: (day['main']['temp'] - 273.15).round,
          date: day['dt_txt']
        }
      elsif Date.parse(day['dt_txt']) == Date.today && today == false
        today = true
        {
          description: day['weather'][0]['description'],
          temperature: (day['main']['temp'] - 273.15).round,
          date: day['dt_txt']
        }
      end
    end
    days_array.reject(&:nil?)
  end
end
