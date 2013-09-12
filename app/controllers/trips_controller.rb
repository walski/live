class TripsController < ApplicationController
  def index
    render json: trips
  end

  def show
    render json: { trip: trips.detect { |trip| trip['id'].to_s == params['id'].to_s } }
  end

private
  def trips
    trips = Bahn.all
    trips = trips.each_with_index.map do |entry, i|
      entry['id']   = i + 1
      entry
    end
    trips
  end
end
