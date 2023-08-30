class EventsController < ApplicationController
  def index
    @title = "Events"
    @events = Event.all
  end
end
