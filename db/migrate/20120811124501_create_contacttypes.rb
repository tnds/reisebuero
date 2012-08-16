class CreateContacttypes < ActiveRecord::Migration
  def change
    create_table :contacttypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
