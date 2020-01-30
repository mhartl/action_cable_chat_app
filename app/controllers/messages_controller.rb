class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!
  # before_action :get_messages

  def index
    byebug
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'roomchannel', 
                                    message: render_message(message)


       message.mentions.each do |mention|
        ActionCable.server.broadcast "room_channel_user_#{mention.id}",
                                     mention: true
      end
    end
  end

  private

    def get_messages
      @messages = Message.for_display
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end

    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end 
end
