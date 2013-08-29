require 'cs_capacityretriever'
require 'cs_capacityretriever/config'
require 'cs_capacityretriever/collectdata'
require 'mongo'

describe CsCapacityretriever::CollectData do
  it "Read an event" do
    CsCapacityretriever::CollectData.collect()
  end
end
