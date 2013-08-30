require 'cs_capacityretriever/config'

require 'mongo'
include Mongo

require 'json'

module CsCapacityretriever
  class DbAccess
    def write(collection, document)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      doc = JSON.parse(document)

      coll = db.collection(collection + "_histories")
      if doc.has_key?("id")
        doc[collection + "id"] = doc["id"]
      end
      id = coll.insert(doc)
      puts "Write " + id.to_s + " to " + collection + "_histories"

      coll = db.collection(collection + "s")
      if doc.has_key?("id")
        doc["_id"] = doc["id"]
        doc.delete("id")
      end
      id = coll.update({ :_id => doc["_id"] }, doc, { :upsert => true })
      puts "Wrote " + id.to_s + " to " + collection + "s"
      return id
    end
  end
end
