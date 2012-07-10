class EventHelper < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :category
  attr_accessible :category
  
  validates :user_id, :uniqueness => { :scope => :event_id, :message => I18n.t('user_already_helper')}, :unless => Proc.new { |e| e.user_id.nil? or e.event_id.nil? }
end
