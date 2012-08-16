class Booking < ActiveRecord::Base
  belongs_to :lodging
  belongs_to :user
  attr_accessible :persons
end
