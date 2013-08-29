class Capacity
  include Mongoid::Document
  field :foo, type: String
  embedded_in :zone
end
