class ChatRoom < ApplicationRecord
  # チャットルームに属するメッセージとの関連付け
  has_many :messages, dependent: :destroy
  
  # チャットルームに参加しているユーザーとの関連付け
  has_many :chat_room_users, dependent: :destroy
  has_many :users, through: :chat_room_users

  belongs_to :owner, class_name: 'User'

  # バリデーション
  validates :name, presence: true, length: { minimum: 1, maximum: 50 }

  # 論理削除されていないチャットルームのみを取得
  scope :active, -> { where(deleted_at: nil) }

  after_create :add_owner_to_users

  private

  def add_owner_to_users
    users << owner
  end
end
