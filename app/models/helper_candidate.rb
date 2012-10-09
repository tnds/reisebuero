class HelperCandidate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :end_at, :start_at, :anonymous, :mod_comment, :location
end
