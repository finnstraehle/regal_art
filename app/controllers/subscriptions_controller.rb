class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
    @title = "Subscriptions"
  end

  def new
    @artist = User.find(params[:artist_id])
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new
    @artist = User.find(params[:artist_id])
    @subscription.artist = @artist
    @subscription.buyer = current_user
    @subscription.save!
    redirect_to dashboard_path
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end
end
