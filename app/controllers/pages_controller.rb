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
    @subscribers_last_90_days = @user.received_subscriptions.where(created_at: 90.days.ago..Time.now).count
    @subscribers_before_90_days = @subscribers - @subscribers_last_90_days
    @subscriber_growth_rate = (@subscribers_last_90_days / @subscribers_before_90_days) * 100
    if @subscribers_before_90_days.zero?
      @subscriber_growth_rate = @subscribers_last_90_days * 100
    else
      @subscriber_growth_rate = (@subscribers_last_90_days / @subscribers_before_90_days) * 100
    end

    @conversations = Conversation.where(artist: @user).count
    @conversations_last_90_days = Conversation.where(artist: @user).where(created_at: 90.days.ago..Time.now).count
    @conversations_before_90_days = @conversations - @conversations_last_90_days
    if @conversations_before_90_days.zero?
      @conversations_growth_rate = @conversations_last_90_days * 100
    else
      @conversations_growth_rate = (@conversations_last_90_days / @conversations_before_90_days) * 100
    end

    @events = @user.events.count
    @event_attendances = EventAttendance.joins(:event).where(event: @user.events, events: { start_date: 6.months.ago..Time.now })
    @events_per_month = @user.events.where(start_date: 6.months.ago..Time.now).group_by_month(&:start_date).transform_values { |events| events.count }
    @event_attendances_per_month = @event_attendances.group_by_month { |event_attendance| event_attendance.event.start_date }.transform_values{|events_attendances| events_attendances.count}

    @average_attendances_per_month = {}
    @events_per_month.each do |key, value|
      if @event_attendances_per_month.key?(key)
        @average_attendances_per_month[key] = @event_attendances_per_month[key].fdiv(value).ceil
      else
        @average_attendances_per_month[key] = 0
      end
    end

    percentage_converted_conversations = (@conversations.to_f / @subscribers) * 100

    @pie_chart_data = {
      "Connections Turned into Conversations" => percentage_converted_conversations,
      "Remaining Connections" => 100 - percentage_converted_conversations
    }
  end

  def edit_portfolio
    @artist = current_user
    @title = "Portfolio"
  end
end
