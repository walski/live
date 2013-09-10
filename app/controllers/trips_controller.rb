class TripsController < ApplicationController
  def index
    trips = Bahn.all
    trips = trips.each_with_index.map do |entry, i| 
      entry["id"]   = i + 1
      entry
    end
    render json: trips
  end
end
