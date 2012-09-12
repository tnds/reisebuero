class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :first_name, :name ,:password, :password_confirmation, :remember_me, :role_id, :disabled
#  has_many :helpers
  has_many :event_helpers, :dependent => :destroy
	belongs_to :role
  has_many :lodgings, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  
  validates :username, :presence => true, :uniqueness => true
  
  after_create do |user|
    if user.role_id.nil?
      user.role_id = Role.find_by_name('User').id
      user.save
    end
  end
  
  def active_for_authentication?
    super and not self.disabled?
  end
  
end
