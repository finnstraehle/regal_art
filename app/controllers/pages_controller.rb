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

    @conversations = Conversation.where(artist: @user).count
    @conversations_last_90_days = Conversation.where(artist: @user).where(created_at: 90.days.ago..Time.now).count
    @conversations_before_90_days = @conversations - @conversations_last_90_days
    if @conversations_before_90_days == 0
      @conversations_growth_rate = @conversations_last_90_days * 100
    else
      @conversations_growth_rate = (@conversations_last_90_days / @conversations_before_90_days) * 100
    end

    @events = @user.events.count
    event_attendances = EventAttendance.where(event: @user.events)
    @total_attendees = event_attendances.count
    @events_per_month = @user.events.group_by {|event| event.start_date.month}.transform_values{|events| events.count}
    @event_attendances_per_month = event_attendances.group_by {|event_attendance| event_attendance.event.start_date.month}.transform_values{|event_attendances| event_attendances.count}

    @average_attendances_per_month = {}

    @events_per_month.each do |key, value|
      if @event_attendances_per_month.key?(key)
        @average_attendances_per_month[key] = (@event_attendances_per_month[key].fdiv(value)).ceil
      else
        @average_attendances_per_month[key] = 0
      end
    end

    @sorted_hash = @average_attendances_per_month.sort.to_h

    month_mapping = {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'October',
      11 => 'November',
      12 => 'December'
    }

    @renamed_hash = {}

    @sorted_hash.each do |month_number, value|
      month_name = month_mapping[month_number]
      @renamed_hash[month_name] = value
    end
  end

  def edit_portfolio
    @artist = current_user
    @title = "Edit Portfolio"
  end
end
