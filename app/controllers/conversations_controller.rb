class ConversationsController < ApplicationController
  def index
    @title = "Conversations"
    @conversations = Conversation.all # change to only the users's conversations
  end
end
