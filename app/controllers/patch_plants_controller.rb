class PatchPlantsController < ApplicationController
  def show
    @patch_plant = PatchPlant.find(params[:id])
    authorize @patch_plant
  end

  def create
    # raise
    @patch = Patch.find(params[:patch_id])
    # @recommended_plants = Plant.this_month_recommended - @patch.plants
    # @other_plants = Plant.all - @recommended_plants
    @plant = Plant.find(patch_plant_params[:plant])
    @patch_plant = PatchPlant.new
    @patch_plant.plant = @plant
    @patch_plant.patch = @patch
    @page = params[:page]
    authorize @patch_plant
    if @patch_plant.save
      respond_to do |format|
        @recommended_plants = Plant.this_month_recommended - @patch.plants
        @other_plants = (Plant.all - @recommended_plants) - @patch.plants
        format.html { redirect_to plant_patch_path(@patch) }
        format.js
      end
    else
      render :new
    end
  end

  def update
    @patch_plant = PatchPlant.find(params[:id])
    @patch_plant.update(patch_plant_params)
    redirect_to patch_path(@patch)
    # if @patch_plant.save
    #   respond_to do |format|
    #     @recommended_plants = Plant.this_month_recommended - @patch.plants
    #     @other_plants = (Plant.all - @recommended_plants) - @patch.plants
    #     format.html { redirect_to patch_path(@patch) }
    #     format.js
    #   end
    # else
    #   render :new
    # end
  end

  def destroy
    @patch_plant = PatchPlant.find(params[:id])
    authorize @patch_plant
    @id = @patch_plant.id
    if @patch_plant.destroy
        respond_to do |format|
        format.html { redirect_to plant_patch_path(@patch_plant.patch) }
        format.js
      end
    end
  end

  private

  def patch_plant_params
    params.require(:patch_plant).permit(:plant_date, :plant)
  end
end

