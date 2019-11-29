class AddCompletedToWeatherAlerts < ActiveRecord::Migration[5.2]
  def change
    add_column :weather_alerts, :completed, :boolean, default: false
  end
end
