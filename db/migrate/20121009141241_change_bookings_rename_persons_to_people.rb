class ChangeBookingsRenamePersonsToPeople < ActiveRecord::Migration
  def up
    change_table :bookings do |t|
      t.rename :persons, :people
    end
  end

  def down
  end
end
