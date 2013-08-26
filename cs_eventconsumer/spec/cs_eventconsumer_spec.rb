require 'cs_eventconsumer'

describe CsEventconsumer::DbAccess do
  #it "Add an event" do
  #  CsEventconsumer::DbAccess.write("Broccoli")
  #end

  it "Read last event" do
    CsEventconsumer::DbAccess.readlatest()
  end
end
