class PatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patch, only: [:show, :edit, :update, :destroy]
  before_action :create_alerts, only: [:show]
  def index
    # @patches = Patch.all
    @patches = policy_scope(Patch)
  end

  def show
    # update_weather
    @weekly_forecast = @patch.week_forecast
    @alerts = @patch.alerts.where(completed: false)
    @weather_alerts = @patch.weather_alerts.where(completed: false)
    @recommended_plants = Plant.this_month_recommended - @patch.plants
    @other_plants = Plant.all - @recommended_plants
    authorize @patch
    @plants = Plant.all
  end

  def new
    @patch = Patch.new
    authorize @patch
  end

  def plant
    @patch = Patch.find(params[:id])
    @recommended_plants = Plant.this_month_recommended - @patch.plants
    @other_plants = Plant.all - @recommended_plants
    authorize @patch
  end

  def create
    @patch = Patch.new(patch_params)
    @patch.user = current_user
    authorize @patch

    if @patch.save
      redirect_to plant_patch_path(@patch)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @patch.update(patch_params)
    redirect_to patch_path(@patch)
  end

  def destroy
    @patch.destroy
    authorize @patch
    redirect_to patches_path
  end

  private

  def create_alerts
    @patch.patch_plants.each(&:check_patch_plant_harvest)
    @patch.patch_plants.each(&:check_patch_plant_sowing)
    @patch.update_weather
    @patch.check_weather
  end

  def find_patch
    @patch = Patch.find(params[:id])
    authorize @patch
  end

  def patch_params
    params.require(:patch).permit(:name, :address)
  end
end
