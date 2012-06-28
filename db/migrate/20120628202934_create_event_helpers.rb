class CreateEventHelpers < ActiveRecord::Migration
  def change
    create_table :event_helpers do |t|
      t.references :event
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :event_helpers, :event_id
    add_index :event_helpers, :user_id
    add_index :event_helpers, :category_id
  end
end
