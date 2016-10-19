class SearchController < ApplicationController
  def index
    @stations = NRELService.by_location(params[:q])
  end
end
