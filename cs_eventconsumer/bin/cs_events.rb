#!/usr/bin/env ruby

require 'daemons'
require 'cs_eventconsumer'

Daemons.run_proc('cs_events') do
  listener = CsEventconsumer::RabbitListener.new()
  loop do
    listener.listen()
  end
end

