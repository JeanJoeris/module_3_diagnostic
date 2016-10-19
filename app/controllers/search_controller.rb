class SearchController < ApplicationController
  def index
    @stations = Station.by_location(params[:q])
  end
end
