class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message.user = current_user
    @message.conversation = @conversation
    @message.save
    redirect_to conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
