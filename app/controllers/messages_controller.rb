class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message.user = current_user
    @message.conversation = @conversation
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: @message.sender?(current_user) ? "conversations/message-2" : "conversations/message-1", locals: { message: @message })
      )
      head :ok
    else
      render "conversations/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
