class AddDeletedAtToChatRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :chat_rooms, :deleted_at, :datetime
  end
end
