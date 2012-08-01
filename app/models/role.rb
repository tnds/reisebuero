class Role < ActiveRecord::Base
  attr_accessible :name
	has_many :users
	validates :name, :uniqueness => true
end
