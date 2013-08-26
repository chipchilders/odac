require 'cs_eventconsumer/config'

require 'mongo'
include Mongo

require 'bunny'
require 'json'

module CsEventconsumer
  class DbAccess
    def self.write(event)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      coll = db.collection(Config::MONGO_COLLECTION)
      doc = JSON.parse(event)
      id = coll.insert(doc)
      puts id
    end

    def self.readlatest()
      conn = Bunny.new(Config::RABBIT_URL)
      conn.start
      ch = conn.create_channel
      q  = ch.queue(Config::RABBIT_QUEUE)
      x  = ch.topic(Config::RABBIT_EXCHANGE)
      q.bind(x, :routing_key => Config::RABBIT_BINDING)

      q.subscribe do |delivery_info, metadata, payload|
          puts "Received #{payload}"
          write(payload)
      end

      x.publish('{"status":"Completed","event":"CONFIGURATION.VALUE.EDIT","account":"e4f70638-ee42-11e2-8591-02004f97000b","user":"e4f72889-ee42-11e2-8591-02004f97000b"}', :routing_key => 'management-server.ActionEvent.CONFIGURATION-VALUE-EDIT.Configuration.*')
      conn.close
      return "Blah"
    end
  end
end
