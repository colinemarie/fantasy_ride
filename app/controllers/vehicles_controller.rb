class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    if params[:query].present?
      ql_query = " \
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
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    return unless @vehicle.geocoded?

    @markers = {
      lat: @vehicle.latitude,
      lng: @vehicle.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { vehicle: @vehicle })
    }
  end
end
