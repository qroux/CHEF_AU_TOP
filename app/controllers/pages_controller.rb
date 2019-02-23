class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @service = Service.new
    @services = Service.last(3)
  end

  def about
  end
end
