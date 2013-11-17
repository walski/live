class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name

  belongs_to :participant, :foreign_key => :xing_id, :primary_key => :xing_id

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def buddies
    @buddies ||= ParticipantBuddy.where(participant_from_id: xing_id).all
  end

  def buddy_requests
    @buddy_requests ||= ParticipantBuddy.where(participant_to_id: xing_id, denied: false).all.select {|pb| !buddies.map(&:participant_to_id).include?(pb.participant_from_id)}
  end
end
