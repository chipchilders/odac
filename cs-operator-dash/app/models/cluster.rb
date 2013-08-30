require 'mongoid'

class Cluster
  include Mongoid::Document
  field :_id, type: String
  field :count

end
