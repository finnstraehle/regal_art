class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message.user = current_user
    @message.conversation = @conversation
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        message1: render_to_string(partial: "conversations/message-1", locals: { message: @message }),
        message2: render_to_string(partial: "conversations/message-2", locals: { message: @message }),
        sender_id: @message.user.id
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
