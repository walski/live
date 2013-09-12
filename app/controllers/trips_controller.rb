class TripsController < ApplicationController
  def index
    render json: Bahn.all
  end
end
