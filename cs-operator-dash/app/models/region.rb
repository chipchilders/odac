require 'mongoid'

class Zone
  include Mongoid::Document
  field :_id, type: String
  field :count

end
