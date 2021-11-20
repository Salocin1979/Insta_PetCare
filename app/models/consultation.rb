class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_many :prescriptions, dependent: :destroy
  before_create :set_room_name

  # callback ActiveRecord 
  def set_room_name
    client = Twilio::REST::Client.new(ENV["KEY_ID"], ENV["AUTH_TOKEN"])
    room = client.video.rooms.create(unique_name: "#{self.animal_id}_#{Time.now.to_i}")
    self.url_room = room.unique_name
  end

end
