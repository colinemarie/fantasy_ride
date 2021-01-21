class MyVehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @user = current_user
    @user.vehicles
  end
end
