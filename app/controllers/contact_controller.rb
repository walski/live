class ContactController < ApplicationController
  def show
    participant = Participant.where(:qr_code => params[:id]).first

    unless participant
      render text: "Badge code not found"
      return
    end

    if !participant.profile_url || participant.profile_url.blank?
      render text: "Sorry, this attendee has no XING profile"
      return
    end

    redirect_to participant.profile_url
  end
end