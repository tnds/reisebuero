class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :lodging
      t.integer :persons
      t.references :user

      t.timestamps
    end
    add_index :bookings, :lodging_id
    add_index :bookings, :user_id
  end
end
