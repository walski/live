class ParticipantBuddy < ActiveRecord::Base
  attr_accessible :participant_from_id, :participant_to_id

  def receiver
    Participant.where(:xing_id => participant_to_id).first
  end

  def sender
    Participant.where(:xing_id => participant_from_id).first
  end
end
