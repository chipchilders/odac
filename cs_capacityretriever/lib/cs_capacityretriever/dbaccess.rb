require 'cs_capacityretriever/config'

require 'mongo'
include Mongo

require 'json'

module CsCapacityretriever
  class DbAccess
    
    def drop(collection)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      coll = db.collection(collection + "s")
      coll.drop()
    end

    def write(collection, document, no_history=false, skip_json_parse=false)
      db = MongoClient.new(Config::MONGO_HOST, Config::MONGO_PORT).db(Config::MONGO_DB)
      doc = JSON.parse(document) unless skip_json_parse
      unless no_history
        coll = db.collection(collection + "_histories")
        if doc.has_key?("id")
          doc[collection + "id"] = doc["id"]
        end
        id = coll.insert(doc)
        puts "Write " + id.to_s + " to " + collection + "_histories"
      end

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
