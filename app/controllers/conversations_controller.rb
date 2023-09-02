class ConversationsController < ApplicationController
  def index
    @title = "Conversations"
    @conversations = Conversation.where(artist: current_user) if current_user.is_artist?
    @conversations = Conversation.where(buyer: current_user) if current_user.is_artist == false
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @title = "Conversation"
  end
end
