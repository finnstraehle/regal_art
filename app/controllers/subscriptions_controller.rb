class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
    @banner = "user1_avatar.jpg"
  end
end
