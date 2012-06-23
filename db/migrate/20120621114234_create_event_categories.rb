class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :event_categories do |t|
      t.references :event
      t.references :category
      t.integer :number_required

      t.timestamps
    end
    add_index :event_categories, :event_id
    add_index :event_categories, :category_id
  end
end
