require 'mongo_mapper'

class Events
  include MongoMapper::Document

  key :status, String
  key :event, String
  key :account, String
  key :user, String
end
