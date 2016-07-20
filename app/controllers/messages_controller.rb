class MessagesController < ApplicationController
  before_action :logged_in_user
  before_action :get_messages

  def index
  end

  def create
    current_user.messages.create(message_params)
    render 'index'
  end

  private

    def get_messages
      @messages = Message.all
      @message  = current_user.messages.build
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
