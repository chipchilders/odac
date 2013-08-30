require 'mongoid'

class Host
  include Mongoid::Document
  field :_id, type: String
  field :count

end
