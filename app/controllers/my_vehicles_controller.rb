class MyVehiclesController < ApplicationController
  def index
    @user = current_user
    @user.vehicles
  end
end
