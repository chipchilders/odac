require 'cs_eventconsumer/config'
require 'cs_eventconsumer/dbaccess'
require 'bunny'

module CsEventconsumer
  class RabbitListener
    def self.listen()
      conn = Bunny.new(Config::RABBIT_URL)
      conn.start
      ch = conn.create_channel
      q  = ch.queue(Config::RABBIT_QUEUE)
      x  = ch.topic(Config::RABBIT_EXCHANGE)
      q.bind(x, :routing_key => Config::RABBIT_BINDING)

      q.subscribe do |delivery_info, metadata, payload|
          puts "Received #{payload}"
          puts "Del Info #{delivery_info}"
          puts "Metadata #{metadata}"
      end

      #x.publish('{"status":"Completed","event":"CONFIGURATION.VALUE.EDIT","account":"e4f70638-ee42-11e2-8591-02004f97000b","user":"e4f72889-ee42-11e2-8591-02004f97000b"}', :routing_key => 'management-server.ActionEvent.CONFIGURATION-VALUE-EDIT.Configuration.*')
    end
  end
end
