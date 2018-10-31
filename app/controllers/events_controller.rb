class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @events = current_user.events
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
          @appointment = Appointment.create(name: @event.title, phone_number: params['event']['phone_number'], time: @event.start)
          message = "The appontment '#{@appointment.name}' was just added."
          TwilioTextMessenger.new(message).call(params['event']['phone_number'])
          User.all.each do |user|
          notification_str =  'Event '+ @event.title + ' was added by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'event', thing_id: @event.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          user.notifications << @notification if user.id != current_user.id
       end
    @event.save
  end

  def update
    @event.update(event_params)
      User.all.each do |user|
          notification_str =  'Event '+ @event.title + ' was update by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'event', thing_id: @event.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          user.notifications << @notification if user.id != current_user.id
       end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :phone_number, :end, :color, :user_ids)
    end
end
