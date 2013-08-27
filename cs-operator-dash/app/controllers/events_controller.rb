class EventsController < ApplicationController
  def index
    @events = Events.all
  end
end
