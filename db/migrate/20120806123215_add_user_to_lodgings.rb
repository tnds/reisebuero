class AddUserToLodgings < ActiveRecord::Migration
  def change
    add_column :lodgings, :user_id, :integer
  end
end
