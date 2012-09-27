class Contacttype < ActiveRecord::Base
  attr_accessible :name, :text
  has_many :contacts
end
