class ChatGroupsController < ApplicationController

  def index
    @chat_groups = current_user.chat_groups
  end

  def new
    @chat_group = ChatGroup.new
    @chat_group.users << current_user
  end

  def edit
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      redirect_to chat_group_messages_path(@chat_group), notice: "グループが作成されました。"
    else
      render :new
    end
  end

  def edit
  end

  private
    def set_chat_group
      @chat_group = ChatGroup.find(params[:id])
    end

    def chat_group_params
      params.require(:chat_group).permit(:team, user_ids: [])
    end
end
