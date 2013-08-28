module CsEventconsumer
  module Config
    MONGO_HOST = "localhost"
    MONGO_PORT = 27017
    MONGO_DB = "cloudstack_events"
    MONGO_COLLECTION = "events"
    RABBIT_URL = "amqp://guest:guest@84.51.246.11:5672"
    RABBIT_QUEUE_NAME = "bunny.examples.hello_world",
    RABBIT_QUEUE_DELETE = false
    RABBIT_EXCHANGE_NAME = "cloudstack-events"
    RABBIT_EXCHANGE_DURABLE = true
    RABBIT_EXCHANGE_DELETE = false
    RABBIT_BINDING = "*.*.*.*.*"
  end
end
