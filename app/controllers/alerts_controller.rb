class AlertsController < ApplicationController
  def complete
    @patch_plant = PatchPlant.find(params[:id])
    @alert = Alert.find(params[:id])
    @alert.completed = true
    if @alert.type_of_alert == 'sowing'
      @patch_plant.update(plant_date: Time.now)
    elsif @alert.type_of_alert == 'harvest'
      @patch_plant.update(harvest_date: Time.now)
    end
    authorize @alert
    @alert.save
    redirect_to patch_path(@alert.patch_plant.patch)
  end
end
