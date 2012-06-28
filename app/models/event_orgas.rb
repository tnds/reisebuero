class EventOrgas < ActiveRecord::Base
  attr_accessible :user, :event, :category
  belongs_to :event
  belongs_to :category
  belongs_to :user
end