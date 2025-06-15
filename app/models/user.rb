class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーが送信したメッセージとの関連付け
  has_many :messages, dependent: :destroy
  
  # ユーザーが参加しているチャットルームとの関連付け
  has_many :chat_rooms, through: :messages
end
