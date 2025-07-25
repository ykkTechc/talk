class CreateChatRoomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_room_users do |t|
      t.references :chat_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :chat_room_users, [:chat_room_id, :user_id], unique: true
  end
end
