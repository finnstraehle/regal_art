class ConversationsController < ApplicationController
  def index
    @title = "Conversations"
    @conversations = Conversation.all # change to only the users's conversations
    @banner = "user1_avatar.jpg"
  end
end
