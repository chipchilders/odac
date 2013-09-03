require 'cs_eventconsumer/config'
require 'cs_eventconsumer/dbaccess'
require 'bunny'

module CsEventconsumer
  class RabbitListener
    def listen()
      conn = Bunny.new(Config::RABBIT_URL)
      db = DbAccess.new()
      conn.start
      ch = conn.create_channel
      q  = ch.queue(Config::RABBIT_QUEUE_NAME, :auto_delete => Config::RABBIT_QUEUE_DELETE)
      x  = ch.topic(Config::RABBIT_EXCHANGE_NAME, :auto_delete => Config::RABBIT_EXCHANGE_DELETE, :durable => Config::RABBIT_EXCHANGE_DURABLE)
      q.bind(x, :routing_key => Config::RABBIT_BINDING).subscribe(:ack => true, :block => false) do |delivery_info, metadata, payload|
          puts "Received #{payload}"
          puts "Del Info #{delivery_info}"
          puts "Metadata #{metadata}"
          db.write(payload)
          ch.acknowledge(delivery_info.delivery_tag, false)
          puts "[consumer1] Got message ##{metadata.headers['i']}, redelivered?: #{delivery_info.redelivered?}, ack-ed"
      end

      #x.publish('{"status":"Completed","event":"CONFIGURATION.VALUE.EDIT","account":"e4f70638-ee42-11e2-8591-02004f97000b","user":"e4f72889-ee42-11e2-8591-02004f97000b"}', :routing_key => 'management-server.ActionEvent.CONFIGURATION-VALUE-EDIT.Configuration.*')
    end
  end
end
