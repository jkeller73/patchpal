class AlertsController < ApplicationController
  def complete
    @alert = Alert.find(params[:id])
    @alert.completed = true
    authorize @alert
    @alert.save
    redirect_to patch_path(@alert.patch_plant.patch)
  end
end
