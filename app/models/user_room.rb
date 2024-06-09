class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create :update_my_rooms_list

  private

  def update_my_rooms_list
    broadcast_append_to(
      'users_rooms_channel',
      partial: 'shared/room',
      locals: { room: Room.find(room_id) },
      target: "user_#{user_id}rooms"
    )
  end
end
