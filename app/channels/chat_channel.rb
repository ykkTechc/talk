class ChatChannel < ApplicationCable::Channel
  def subscribed
    # チャットルームごとのストリームを設定
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
    # ストリームの解除
    stop_all_streams
  end

  def speak(data)
    message = Message.create!(
      content: data['message'],
      user_id: current_user.id,
      chat_room_id: data['room_id']
    )

    ActionCable.server.broadcast(
      "chat_#{data['room_id']}",
      {
        html: render_message(message)
      }
    )
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end
