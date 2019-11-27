class PlantsController < ApplicationController
  def index
    # @plants = Plant.all
    @plants = policy_scope(Plant)
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
  end
end
