class EventsController < ApplicationController
  def index
    @events = Event.all.shuffle
    @banner = "user1_avatar.jpg"
    @title = "Events"
  end

  def show
    @event = Event.find(params[:id])
    @title = @event.title
    @events = Event.all
    @banner = "user1_avatar.jpg"
  end

  def new
    @event = Event.new
    @title = "New Event"
  end

  def create
    event = Event.create(event_params)
    redirect_to event_path(event)
  end

  def my_events
    @events = current_user.events
    @banner = "user1_avatar.jpg"
    @title = "My Events"
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    # redirect_to my_events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :is_private)
  end
end
