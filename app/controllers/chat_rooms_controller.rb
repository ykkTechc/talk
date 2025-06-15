class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: [:show, :destroy]

  def index
    @chat_rooms = ChatRoom.includes(:messages).order(updated_at: :desc)
  end

  def show
    @messages = @chat_room.messages.includes(:user).order(created_at: :asc)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.owner = current_user

    if @chat_room.save
      redirect_to @chat_room, notice: 'チャットルームを作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @chat_room.owner == current_user
      @chat_room.destroy
      redirect_to chat_rooms_path, notice: 'チャットルームを削除しました'
    else
      redirect_to chat_rooms_path, alert: 'チャットルームを削除する権限がありません'
    end
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
