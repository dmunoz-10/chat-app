class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create :broadcast_messages_create

  private

  def broadcast_messages_create
    broadcast_append_to(
      'room_messages_channel',
      partial: 'messages/message',
      locals: { message: self },
      target: "room_messages_#{room_id}_div"
    )
  end
end
