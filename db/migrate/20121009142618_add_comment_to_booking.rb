class AddCommentToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :comment, :string
  end
end
