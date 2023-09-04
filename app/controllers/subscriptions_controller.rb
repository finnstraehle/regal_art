class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
    @title = "Subscriptions"
  end

  def create
    @subscription = Subscription.new
    @artist = User.find(params[:user_id])
    @subscription.artist = @artist
    @subscription.buyer = current_user
    @subscription.save!
    redirect_to user_path(@artist)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription&.destroy
    @conversation = Conversation.find_by(buyer: current_user, artist: @subscription.artist)
    @conversation&.destroy # maybe not needed
    redirect_to user_path(@subscription.artist)
  end
end
