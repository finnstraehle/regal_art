class EventsController < ApplicationController
  def index
    @events = Event.all.shuffle
    @banner = "user1_avatar.jpg"
    @title = "Events"
    start_date = DateTime.parse(params[:start_date]) if params[:start_date].present?

    if params[:query].present?
      sql_subquery = <<~SQL
        events.title ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
      SQL
      @events = Event.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    end
    @events = Event.where(location: params[:location]) if params[:location].present?

    @events = Event.where(start_date: start_date.beginning_of_day..start_date.end_of_day) if params[:start_date].present?

  end

  def show
    @event = Event.find(params[:id])
    @title = @event.title
    @events = Event.all
    @banner = "user1_avatar.jpg"
    @event_attendance = EventAttendance.new
    @markers = [
      {
        lat: @event.latitude,
        lng: @event.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    ]
    @hide_join_button = true if current_user.is_artist?
  end

  def new
    @event = Event.new
    @title = "New Event"
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to my_events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def my_events
    @events = current_user.events
    @title = "My Events"
  end

  def joined_events
    @events = Event.joins(:event_attendances).where(event_attendances: { user: current_user })
    @title = "My Events"
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    # redirect_to my_events_path, status: :see_other
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)

    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :is_private)
  end
end
