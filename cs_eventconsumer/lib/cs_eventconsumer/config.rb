module CsEventconsumer
  module Config
    MONGO_HOST = "localhost"
    MONGO_PORT = 27017
    MONGO_DB = "cloudstack-events"
    MONGO_COLLECTION = "events"
    RABBIT_URL = "amqp://guest:guest@84.51.246.11:5672"
    RABBIT_QUEUE = {
      :name => "bunny.examples.hello_world",
      :auto_delete => false
    }
    RABBIT_EXCHANGE = { 
      :name => "cloudstack-events",
      :durable => true,
      :auto_delete => false
    }
    RABBIT_BINDING = "*.*.*.*.*"
  end
end
