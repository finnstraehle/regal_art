class ConversationsController < ApplicationController
  def index
    @title = "Conversations"
    @conversations = Conversation.where(artist: current_user) if current_user.is_artist?
    @conversations = Conversation.where(buyer: current_user) if current_user.is_artist == false
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.order("created_at ASC")
    @message = Message.new
    @title = "Conversation"
  end

  def create
    @conversation = Conversation.new
    @conversation.artist = User.find(params[:user_id])
    @conversation.buyer = current_user
    @conversation.save
    redirect_to conversation_path(@conversation)
  end
end
