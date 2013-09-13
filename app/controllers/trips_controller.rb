class TripsController < ApplicationController
  def index
    render json: trips
  end

  protected

  def trips
    cache(expires_in: 5.minutes) { Bahn.all }
  end
end
