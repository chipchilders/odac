require 'cs_eventconsumer/config'

require 'mongo'
include Mongo

require 'json'

module CsEventconsumer
  class DbAccess
    def write(event)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      coll = db.collection(Config::MONGO_COLLECTION)
      doc = JSON.parse(event)
      id = coll.insert(doc)
      puts id
    end
  end
end
