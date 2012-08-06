class Lodging < ActiveRecord::Base
  attr_accessible :accessible, :description, :end_at, :event, :location, :maplink, :max_people, :request, :start_at
  
  has_many :bookings, :dependent => :destroy
  belongs_to :user
  belongs_to :event
end
