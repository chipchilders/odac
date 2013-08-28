class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def json
    @events = Event.all
    render json: @events
  end

end
