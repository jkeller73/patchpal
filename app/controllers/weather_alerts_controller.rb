class WeatherAlertsController < ApplicationController
  def complete
    @weather_alert = WeatherAlert.find(params[:id])
    @weather_alert.completed = true
    authorize @weather_alert
    @weather_alert.save
    redirect_to patch_path(@weather_alert.patch)
  end
end
