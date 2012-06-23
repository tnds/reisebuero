class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.text :location
      t.text :description
      t.boolean :all_day

      t.timestamps
    end
  end
end
