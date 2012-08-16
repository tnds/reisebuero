class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.references :event
      t.references :user
      t.date :start_at
      t.date :end_at
      t.integer :max_people
      t.boolean :accessible
      t.text :description
      t.text :location
      t.text :maplink
      t.boolean :request

      t.timestamps
    end
    add_index :lodgings, :event_id
    add_index :lodgings, :user_id
  end
end
