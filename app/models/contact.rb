class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :contacttype
  attr_accessible :address, :public, :contacttype_id
  
  validates :contacttype_id, :presence => true
  validates :address, :presence => true
end
