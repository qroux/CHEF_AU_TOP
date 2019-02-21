class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @service = Service.find(params[:service_id])
    authorize @service
    render "services/show"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    @service = Service.find(params[:service_id])
    @booking.service = @service
    if @booking.save
      redirect_to bookings_path
    else
      render "services/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  def list_chief_bookings
    # on veut afficher les services du chef qui ont ete reserve.
    # Pour cela on regarde les services de current_user(chef qui a cree le service)
    # On recupere chaque service et on appelle leur bookings
    @bookings = current_user.services.map { |service| service.bookings }.flatten
  end

  private

  def booking_params
    params.require(:booking).permit(:quantity, :place, :user_id, :service_id)
  end
end
