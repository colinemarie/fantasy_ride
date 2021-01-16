class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    if params[:query].present?
      sql_query = " \
      name ILIKE :query \
      OR description ILIKE :query \
      "
      @vehicles = Vehicle.where(sql_query, query: "%#{params[:query]}%")
    else
      @vehicles = Vehicle.all
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
    @reservation = Reservation.new
  end
end
