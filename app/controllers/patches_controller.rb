class PatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_patch, only: [:show, :edit, :update, :destroy]

  def index
    @patches = Patch.all
  end

  def show
    def get_location_and_weather
      @ip = request.remote_ip
      @user_location = JSON.parse(open("http://iplocate.io/api/lookup/#{@ip}").read)
      @coordinates = [@user_location['latitude'], @user_location['longitude']]
      if @coordinates[0] && @coordinates[1]
        puts "=========================USERLOCATION: #{@coordinates}============================="
        forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=#{@coordinates[0]}&lon=#{@coordinates[1]}&APPID=#{ ENV['18b091f6bd0d6e9dd89c56e5ce648f2b
'] }").read)
      else
        forecast = JSON.parse(open("http://api.openweathermap.org/data/2.5/forecast?lat=51.5074&lon=0.1278&APPID=#{ ENV['18b091f6bd0d6e9dd89c56e5ce648f2b
'] }").read)
      end
      days_array = forecast['list']
      @today = days_array[0]['weather'][0]['description']
      @temperature = (days_array[0]['main']['temp'] - 273.15).round
    end
  end

  def new
    @patch = Patch.new
    authorize @patch
  end

  def create
    @patch = Patch.new(patch_params)
    @patch.user = current_user
    authorize @patch

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
    authorize @patch
    redirect_to patches_path
  end

  private

  def find_patch
    @patch = Patch.find(params[:id])
  end

  def patch_params
    params.require(:patch).permit(:address)
  end
end
