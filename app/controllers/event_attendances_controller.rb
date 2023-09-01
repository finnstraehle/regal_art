class EventAttendancesController < ApplicationController

  def index
    @event_attendances = EventAttendance.all
  end

  def show
    @event_attendance = EventAttendance.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @event_attendance = EventAttendance.new
  end

  def create
    @event_attendance = EventAttendance.new(event_attendance_params)
    @event = Event.find(params[:event_id])
    @event_attendance.event = @event
    @event_attendance.user = current_user
    @event_attendance.save
    redirect_to event_path(@event)
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:event_id, :user_id, :message, :attendees)
  end
end
