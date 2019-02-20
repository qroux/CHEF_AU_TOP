class PagesController < ApplicationController
  def home
    @service = Service.new
  end
end
