class Room < ApplicationRecord
  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :name, presence: true

  after_update :update_room_details

  private

  def update_room_details
    broadcast_replace_to(
      'room_details_channel',
      partial: 'shared/room',
      locals: { room: self },
      target: "room_#{id}"
    )
  end
end
