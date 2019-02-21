class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @services = policy_scope(Service).search_by_menu_name_and_category(params[:query])
    else
      @services = policy_scope(Service)
    end
  end

  def show
    @service = Service.find(params[:id])
    @booking = Booking.new
    authorize @service
  end

  def new
    @service = Service.new
    authorize @service
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    authorize @service
    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
    authorize @service
  end

  def update
    @service = Service.find(params[:id])
    authorize @service
    @service.update(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    authorize @service
    @service.destroy
    redirect_to services_path
  end



  private

  def service_params
    params.require(:service).permit(:menu, :menu_name, :price, :max_quantity, :category, :date, :shift, :picture)
  end
end
