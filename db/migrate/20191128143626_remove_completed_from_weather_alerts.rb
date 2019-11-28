class RemoveCompletedFromWeatherAlerts < ActiveRecord::Migration[5.2]
  def change
    remove_column :weather_alerts, :completed, :boolean
  end
end
