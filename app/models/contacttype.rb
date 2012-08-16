class Contacttype < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts
end
