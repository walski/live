class AddsXingIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :xing_id, :string
  end
end
