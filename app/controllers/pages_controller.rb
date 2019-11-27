class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @home = true
  end

  def dashboard
    @patches = current_user.patches
  end
end
