require 'mongoid'

class Zone_History
  include Mongoid::Document
  field :_id, type: String
  field :count

end
