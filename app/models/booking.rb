class Booking < ActiveRecord::Base
  attr_accessible :lodging, :persons, :user
  
  belongs_to Lodging
end
