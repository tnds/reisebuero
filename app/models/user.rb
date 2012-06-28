class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :first_name, :name ,:password, :password_confirmation, :remember_me
#  has_many :helpers
  has_many :event_orgas, :dependent => :destroy
  has_many :events, :through => :event_orgas, :class_name => :organized
end
