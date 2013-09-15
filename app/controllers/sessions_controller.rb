class SessionsController < ApplicationController
  def index
    render json: sessions
  end

  protected

  def sessions
    cache(:sessions, expires_in: 5.minutes) do
      Schedule.all
    end
  end
end
