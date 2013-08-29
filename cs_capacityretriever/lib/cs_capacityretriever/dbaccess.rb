require 'cs_capacityretriever/config'

require 'mongo'
include Mongo

require 'json'

module CsCapacityretriever
  class DbAccess
    def write(collection, document)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      coll = db.collection(collection)
      doc = JSON.parse(document)
      id = coll.insert(doc)
      puts id
    end
  end
end
