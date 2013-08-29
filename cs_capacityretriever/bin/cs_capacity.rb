#!/usr/bin/env ruby

require 'daemons'
require 'cs_capacityretriever'
require 'cs_capacityretriever/collectdata'

Daemons.run_proc('cs_capacity') do
  listener = CsCapacityretriever::CollectData.new()
  loop do
    listener.collect()
    sleep(30)
  end
end

