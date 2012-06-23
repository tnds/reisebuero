class EventOrga < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :category
  # attr_accessible :title, :body
end
