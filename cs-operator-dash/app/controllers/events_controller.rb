class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def json
    @events = Event.all
    render json: @events
  end

  def view
    @event = Event.find(params[:id])
  end

end
