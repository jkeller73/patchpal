class PatchPlantsController < ApplicationController
  def create
    @patch = Patch.find(params[:patch_id])
    @patch_plant = PatchPlant.new(patch_plant_params)
    @patch_plant.patch = @patch
    if @patch_plant.save
      redirect_to patch_path(@patch)
    else
      render :new
    end
  end

  def update
    @patch_plant = PatchPlant.find(params[:id])
    @patch_plant.update(patch_plant_params)
    redirect_to patch_path(@patch)
  end

  def destroy
    @patch_plant = PatchPlant.find(params[:id])
    @patch_plant.destroy
    redirect_to patch_path(@patch_plant.patch)
  end

  private

  def patch_plant_params
    params.require(:patch_path).permit(:plant_date, :plant)
  end
end
