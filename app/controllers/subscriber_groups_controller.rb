class SubscriberGroupsController < ApplicationController
  def index
    @all_group = SubscriberGroup.new(title: "All Subscribers", user: current_user)
    @groups = current_user.subscriber_groups
    @groups << @all_group unless @groups.include?(SubscriberGroup.find_by(title: "All Subscribers", user: current_user))
    @received_subscriptions = current_user.received_subscriptions
    @subscribers_last_month = current_user.received_subscriptions.where(created_at: 1.month.ago..Time.now).count
    @title = "Subscribers"
  end

  def show
    @message = Message.new
    @group = SubscriberGroup.find(params[:id])
    @title = @group.title
    @broadcast_messages = @group.messages.uniq(&:content)
  end

  def new_broadcast
    @message = Message.new(message_params)
    @group = SubscriberGroup.find(params[:subscriber_group_id])
    @group.group_attendances.each do |attendance|
      Message.create!(
        conversation: Conversation.find_by(buyer: attendance.user, artist: @group.user).nil? ? Conversation.create!(buyer: attendance.user, artist: @group.user) :  Conversation.find_by(buyer: attendance.user, artist: @group.user),
        subscriber_group: @group,
        user: @group.user,
        content: @message.content
      )
    end
    redirect_to subscriber_group_path(@group)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end


# @message = Message.new(message_params)
# @conversation = Conversation.find(params[:conversation_id])
# @message.user = current_user
# @message.conversation = @conversation
