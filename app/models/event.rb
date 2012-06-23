class Event < ActiveRecord::Base
  has_event_calendar
  attr_accessible :all_day, :description, :end_at, :location, :name, :start_at
  has_many :event_categories
  has_many :event_orgas
  has_many :event_helpers
end
