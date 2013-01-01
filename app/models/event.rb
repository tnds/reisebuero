class Event < ActiveRecord::Base     
  has_event_calendar
  geocoded_by :location
  attr_accessible :all_day, :description, :end_at, :location, :name, :start_at, :uid, :latitude, :longitude
  has_many :event_categories, :dependent => :destroy
  has_many :categories, :through => :event_categories
  has_many :event_helpers, :dependent => :destroy
  has_many :lodgings, :dependent => :destroy
  
  validates :name, :start_at, :end_at, :presence => true
	validates :uid, :uniqueness => true
  
  after_validation :geocode, :if => :location_changed?
	
	before_create do |event|
		event.uid = UUIDTools::UUID.random_create.to_s
	end
end
