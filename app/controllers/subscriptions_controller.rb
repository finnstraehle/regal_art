class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
    @title = "Subscriptions"
  end
end
