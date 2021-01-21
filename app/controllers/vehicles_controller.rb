class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!,
  only: [ :index, :show ]

  def index
    @vehicles = Vehicle.all
    if params[:vehicle].present? && params[:vehicle][:category_ids].present?
      @vehicles = @vehicles.joins(:categories).where(categories: { id: params[:vehicle][:category_ids]})
    end
    if params[:query].present?
      sql_query = " \
      vehicles.name ILIKE :query \
      OR vehicles.description ILIKE :query \
      OR categories.name ILIKE :query \
      "
      @vehicles = @vehicles.joins(:categories).where(sql_query, query: "%#{params[:query]}%")
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

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to my_vehicles_path
    else
      render "vehicles/new"
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:name,
                                    :price_per_day,
                                    :description,
                                    :address,
                                    :capacity,
                                    :minimum_age,
                                    :user,
                                    photos: [])
  end
end
