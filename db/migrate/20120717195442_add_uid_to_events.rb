class AddUidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :uid, :string
  end
end
