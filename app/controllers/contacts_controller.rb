class ContactsController < ApplicationController
  def index
    @contacts =  [
      {
        first_name: 'uschi',
        last_name: 'muschi',
      }
    ]

    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end
end
