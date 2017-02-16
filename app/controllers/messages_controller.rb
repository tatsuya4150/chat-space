class MessagesController < ApplicationController
  before_action :set_chat_groups
  before_action :set_chat_group

  def index
    @message = Message.new
    @messages = @chat_group.messages
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.chat_group = @chat_group
    respond_to do |format|
      if @message.save
        format.html do
          redirect_to chat_group_messages_path(@chat_group)
        end
        format.json
      else
        flash.now[:alert] = 'メッセージの送信ができませんでした'
        render :index
      end
    end
  end

  private

  def set_chat_groups
    @chat_groups = ChatGroup.all
  end

  def set_chat_group
    @chat_group = ChatGroup.find(params[:chat_group_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

end
