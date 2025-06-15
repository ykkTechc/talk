class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  default_scope -> { order(created_at: :desc) }
end
