class SessionsController < ApplicationController
  def index
    @sessions = [
      {time: "9:00",  title: "Doors open"},
      {time: "9:15",  title: "Breakfast"},
      {time: "10:45", title: "Talk"},
      {time: "11:45", title: "Talk"},
      {time: "12:30", title: "Coffee Break"},
      {time: "13:00", title: "Talk"},
      {time: "13:45", title: "Lunch break"},
      {time: "14:45", title: "Talk"},
      {time: "15:30", title: "Coffee Break"},
      {time: "16:00", title: "Lightning talks"},
      {time: "17:00", title: "Break"},
      {time: "17:30", title: "Talk"},
      {time: "18:15", title: "Party & Buffet"},
    ]
    render json: @sessions
  end
end
