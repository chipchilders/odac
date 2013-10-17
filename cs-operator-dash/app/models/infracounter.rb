require 'mongoid'

class Infracounter
  include Mongoid::Document
  field :_id, type: String
end
