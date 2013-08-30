require 'mongoid'

class Pod
  include Mongoid::Document
  field :_id, type: String
  field :count
end
