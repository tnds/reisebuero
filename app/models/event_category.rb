class EventCategory < ActiveRecord::Base
  belongs_to :event
  belongs_to :category
  attr_accessible :number_required
end
