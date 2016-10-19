class SearchController < ApplicationController
  def index
    # @stations = NRELService.by_location(params[:q])
    @stations = Station.by_location(params[:q])
  end
end
