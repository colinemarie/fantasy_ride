class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  # def create
  #   @vehicle = Vehicle.find(params[:vehicle_id])
  #   @reservation = Reservation.new(reservation_params)
  #   @reservation.vehicle = @vehicle
  #   @reservation.user = current_user
  #   @reservation.duration = (@reservation.end_date - @reservation.start_date)
  #   @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @vehicle.price_per_day
  #   if @reservation.save
  #     redirect_to reservations_path
  #   else
  #     render "vehicles/show"
  #   end
  # end

  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.vehicle = @vehicle
    @reservation.user = current_user
    @reservation.duration = (@reservation.end_date - @reservation.start_date).to_i
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @vehicle.price_per_day
    if @reservation.save
      redirect_to reservations_path
    else
      render "vehicles/show"
    end
  end

  def index
    @reservations = Reservation.all.where(user: current_user)
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: "cancelled")
    redirect_to reservations_path
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @vehicle = @reservation.vehicle
    @reservation.update(status: "accepted")
    redirect_to my_vehicle_vehicle_reservations_path(@vehicle)
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @vehicle = @reservation.vehicle
    @reservation.update(status: "declined")
    redirect_to my_vehicle_vehicle_reservations_path(@vehicle)
  end

  # def destroy
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.destroy
  #   redirect_to reservations_path
  # end

  # def duration
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.duration = (@reservation.end_date - @reservation.start_date)
  # end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :status)
  end
end
