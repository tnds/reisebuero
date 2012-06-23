class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :login, :name, :password
  has_many :event_helpers
  has_many :event_orgas
end
