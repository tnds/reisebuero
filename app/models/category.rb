class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :event_categories
  has_many :event_helpers
end
