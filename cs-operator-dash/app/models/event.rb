require 'mongoid'

class Event
  include Mongoid::Document

#  field :status, :type String
  field :event, type: String
#  field :account, type: String
#  field :user, type: String
end
