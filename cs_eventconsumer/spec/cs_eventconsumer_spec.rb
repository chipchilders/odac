require 'cs_eventconsumer'
require 'cs_eventconsumer/config'
require 'bunny'

describe CsEventconsumer::RabbitListener do
  it "Read an event" do
    conn = Bunny.new(CsEventconsumer::Config::RABBIT_URL)
    conn.start
    ch = conn.create_channel
    x  = ch.topic(CsEventconsumer::Config::RABBIT_EXCHANGE_NAME, :auto_delete => CsEventconsumer::Config::RABBIT_EXCHANGE_DELETE, :durable => CsEventconsumer::Config::RABBIT_EXCHANGE_DURABLE)
    x.publish('{"status":"Completed","event":"CONFIGURATION.VALUE.EDIT","account":"e4f70638-ee42-11e2-8591-02004f97000b","user":"e4f72889-ee42-11e2-8591-02004f97000b"}', :routing_key => 'management-server.ActionEvent.CONFIGURATION-VALUE-EDIT.Configuration.*')
    #CsEventconsumer::RabbitListener.listen()
  end
end
