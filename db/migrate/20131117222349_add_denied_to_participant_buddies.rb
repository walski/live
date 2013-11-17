class AddDeniedToParticipantBuddies < ActiveRecord::Migration
  def change
    add_column :participant_buddies, :denied, :boolean, default: false
  end
end
