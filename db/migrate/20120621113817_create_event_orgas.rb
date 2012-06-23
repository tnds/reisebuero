class CreateEventOrgas < ActiveRecord::Migration
  def change
    create_table :event_orgas do |t|
      t.references :event
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :event_orgas, :event_id
    add_index :event_orgas, :user_id
    add_index :event_orgas, :category_id
  end
end
