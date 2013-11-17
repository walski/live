class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :qr_code, unique: true
      t.string :name
      t.string :photo_url
      t.string :profile_url
      t.string :xing_id, unique: true

      t.timestamps
    end
  end
end