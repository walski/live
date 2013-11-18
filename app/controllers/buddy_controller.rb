class BuddyController < ApplicationController
  before_filter :only_logged_in!

  def add_buddy
    buddy_code = params[:"buddy-code"]
    raise "Must specify buddy id" unless buddy_code
    buddy = Participant.where(:qr_code => buddy_code).first

    unless buddy
      redirect_to '/', :notice => "No badge with the number #{buddy_code} found :("
      return
    end

    buddy_options = {participant_from_id: current_user.xing_id, participant_to_id: buddy.xing_id}

    existing_buddy = ParticipantBuddy.where(buddy_options).first
    if existing_buddy
      flash[:notice] = "#{buddy.name} is your buddy already."
    else
      xing_client.create_contact_request(:user_id => buddy.xing_id, :message => "Hey there, we met at an X - Session event!")
      ParticipantBuddy.create!(buddy_options)
      flash[:notice] = "#{buddy.name} added as your buddy."
    end

    redirect_to '/'
  end

  def index
  end

  def requests
  end

  def accept
    buddy = ParticipantBuddy.where(participant_to_id: current_user.xing_id, id: params[:id]).first

    unless buddy
      redirect_to '/buddies', notice: "Buddy not found!"
      return
    end

    buddy_options = {participant_from_id: current_user.xing_id, participant_to_id: buddy.participant_from_id}
    if ParticipantBuddy.where(buddy_options).first
      redirect_to '/buddies', notice: "Buddy already added!"
      return
    end

    xing_client.accept_contact_request(:user_id => buddy.participant_from_id)
    ParticipantBuddy.create!(buddy_options)

    redirect_to '/buddies', notice: "#{buddy.sender.name} accepted"
  end

  def deny
    buddy = ParticipantBuddy.where(participant_to_id: current_user.xing_id, id: params[:id]).first

    unless buddy
      redirect_to '/buddies', notice: "Buddy not found!"
      return
    end

    buddy_options = {participant_from_id: current_user.xing_id, participant_to_id: buddy.participant_from_id}
    if ParticipantBuddy.where(buddy_options).first
      redirect_to '/buddies', notice: "Buddy already added!"
      return
    end

    xing_client.deny_contact_request(:user_id => buddy.participant_from_id)
    buddy.denied = true
    buddy.save!

    redirect_to '/buddies', notice: "#{buddy.sender.name} rejected"
  end

  protected

  def only_logged_in!
    redirect_to '/', notice: "Must be logged in"
  end
end