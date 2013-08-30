require 'mongoid'

class Storagepool
  include Mongoid::Document
  field :_id, type: String
  field :count

end
