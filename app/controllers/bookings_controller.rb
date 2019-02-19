class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # def new
  #   @booking = Booking.new()
  #   @service = Service.find(params[:service_id])
  # end

  def create
    @booking = Booking.new(booking_params)
    @service = Service.find(params[:service_id])
    @booking.service = @service
    if @booking.save
      redirect_to booking_path(@bookings)
    else
      render :new
    end
  end

  def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to booking_path(@bookings)
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity, :place, :user_id, :service_id)
  end

end
