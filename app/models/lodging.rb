class Lodging < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :bookings
  attr_accessible :accessible, :event_id, :description, :end_at, :location, :maplink, :max_people, :request, :start_at, :anonymous
  
  validates :start_at, :end_at, :max_people, :presence => true
end
