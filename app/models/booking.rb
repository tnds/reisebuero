class BookingsValidator < ActiveModel::Validator
  def validate(record)
    unless record.lodging.bookings.sum(:people) <= record.lodging.max_people
      record.errors[:people] << 'bookings_error_overbooked'
    end
  end
end

class Booking < ActiveRecord::Base
  belongs_to :lodging
  belongs_to :user
  attr_accessible :people, :comment
  
  validates :people, :presence => true
  validates_with BookingsValidator
end