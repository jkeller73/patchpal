class PatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patch, only: [:show, :edit, :update, :destroy]

  def index
    @patches = Patch.all
  end

  def show
  end

  def new
    @patch = Patch.new
  end

  def create
    @patch = Patch.new(patch_params)
    @patch.user = current_user

    if @patch.save
      redirect_to patch_path(@patch)
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
    redirect_to patches_path
  end

  private

  def find_patch
    @patch = Patch.find(params[:id])
  end

  def  patch_params
    params.require(:patch).permit(:address)
  end
end
