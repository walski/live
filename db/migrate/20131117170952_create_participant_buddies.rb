class CreateParticipantBuddies < ActiveRecord::Migration
  def change
    create_table :participant_buddies do |t|
      t.string :participant_from_id
      t.string :participant_to_id

      t.timestamps
    end
  end
end
