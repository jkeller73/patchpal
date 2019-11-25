class CreateDailyWeatherReports < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_weather_reports do |t|
      t.date :date
      t.text :description
      t.float :temperature
      t.references :patch, foreign_key: true

      t.timestamps
    end
  end
end
