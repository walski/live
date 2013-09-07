class SessionsController < ApplicationController
  def index
    @sessions = [
      {id: 1,  time: "9:00",  title: "Doors open"},
      {id: 2,  time: "9:15",  title: "Breakfast"},
      {id: 3,  time: "10:45", title: "Talk"},
      {id: 4,  time: "11:45", title: "Talk"},
      {id: 5,  time: "12:30", title: "Coffee Break"},
      {id: 6,  time: "13:00", title: "Talk"},
      {id: 7,  time: "13:45", title: "Lunch break"},
      {id: 8,  time: "14:45", title: "Talk"},
      {id: 9,  time: "15:30", title: "Coffee Break"},
      {id: 10, time: "16:00", title: "Lightning talks"},
      {id: 11, time: "17:00", title: "Break"},
      {id: 12, time: "17:30", title: "Talk"},
      {id: 13, time: "18:15", title: "Party & Buffet"},
    ]
    render json: @sessions
  end
end
