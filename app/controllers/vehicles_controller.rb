class VehiclesController < ApplicationController
  def index
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
