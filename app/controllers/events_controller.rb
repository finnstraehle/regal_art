class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params)
    redirect_to event_path(event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :is_private)
  end
end
