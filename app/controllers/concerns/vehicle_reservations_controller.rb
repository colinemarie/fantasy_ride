class VehicleReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @vehicle = Vehicle.find(params[:my_vehicle_id])
    @pending_reservations = @vehicle.reservations.where(status: "pending")
    @accepted_reservations = @vehicle.reservations.where(status: "accepted")
    @declined_reservations = @vehicle.reservations.where(status: "declined")
    @cancelled_reservations = @vehicle.reservations.where(status: "cancelled")
  end
end

