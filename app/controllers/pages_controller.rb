class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # think about this, but I think it's only :home

  def home
    @hide_nav_footer = true
  end

  def dashboard
    @title = "Dashboard"
  end

  def artist_dashboard
    @title = "Dashboard"
  end

  def analytics
    @title = "Analytics"
    @user = current_user
    @subscribers = @user.received_subscriptions.count
    @events = @user.events.count
    @conversations = @user.conversations.count
    @subscribers_last_month = @user.received_subscriptions.where(created_at: 1.month.ago..Time.now).count
    @subscribers_last_week = @user.received_subscriptions.where(created_at: 1.week.ago..Time.now).count
    @subscribers_yesterday = @user.received_subscriptions.where(created_at: 1.day.ago..Time.now).count

  end

  def edit_portfolio
    @artist = current_user
    @title = "Edit Portfolio"
  end
end
