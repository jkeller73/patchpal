class CreateWeatherAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_alerts do |t|
      t.string :type_of_alert
      t.string :message
      t.references :patch, foreign_key: true

      t.timestamps
    end
  end
end
