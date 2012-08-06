class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :lodging
      t.integer :persons
      t.references :user

      t.timestamps
    end
  end
end
