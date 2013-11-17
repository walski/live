class Participant < ActiveRecord::Base
  attr_accessible :qr_code, :name, :xing_id, :profile_url, :photo_url

  def small_photo_url
    (photo_url || '').gsub('140x185', '30x40')
  end
end
