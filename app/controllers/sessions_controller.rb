class SessionsController < ApplicationController
  def index
    render json: sessions
  end

  protected

  def sessions
    cache(expires_in: 5.minutes) do
      sessions = File.open(Rails.root.join('config/schedule.json')) { |f| JSON.parse(f.read) }
      slots = sessions["slots"].each_with_index.map do |entry, i|
        entry["id"]   = i + 1
        entry["time"] = Time.at entry["time"]
        entry
      end
    end
  end
end
