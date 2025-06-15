class AddOwnerToChatRooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chat_rooms, :owner, foreign_key: { to_table: :users }
  end
end
