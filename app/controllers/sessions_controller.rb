class SessionsController < ApplicationController
  def index
    # TODO (ps) load from socoded
    sessions = File.open(Rails.root.join('config/schedule.json')) { |f| JSON.parse(f.read) }
    slots = sessions["slots"].each_with_index.map do |entry, i| 
      entry["id"]   = i + 1
      entry["time"] = Time.at entry["time"]
      entry
    end
    render json: slots
  end
end
