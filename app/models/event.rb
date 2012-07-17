class Event < ActiveRecord::Base     
  has_event_calendar
  attr_accessible :all_day, :description, :end_at, :location, :name, :start_at, :uid
  has_many :event_categories, :dependent => :destroy
  has_many :categories, :through => :event_categories
  has_many :event_helpers, :dependent => :destroy
  
  validates :name, :start_at, :end_at, :presence => true
	validates :uid, :uniqueness => true
	
	before_create do |event|
		event_helper = event.event_helpers.build
    event_helper.user = current_user
    event_helper.orga = true
    event_helper.save
		event.uid = UUIDTools::UUID.random_create.to_s
	end
end
