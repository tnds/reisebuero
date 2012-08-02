class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :first_name, :name ,:password, :password_confirmation, :remember_me, :role_id
#  has_many :helpers
  has_many :event_helpers, :dependent => :destroy
	belongs_to :role
  
  validates :username, :presence => true, :uniqueness => true
  
  after_create do |user|
    if Users.any?
      user.role_id = Role.find_by_name('User').id
      user.save
    end
  end
end
