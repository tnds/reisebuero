class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.references :event
      t.date :start_at
      t.date :end_at
      t.text :description
      t.text :location
      t.integer :max_people
      t.boolean :accessible
      t.text :maplink
      t.boolean :request

      t.timestamps
    end
    add_index :lodgings, :event_id
  end
end
