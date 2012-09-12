class AddAnonymousToLodging < ActiveRecord::Migration
  def change
    add_column :lodgings, :anonymous, :boolean
  end
end
