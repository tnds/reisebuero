class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user
      t.references :contacttype
      t.string :address
      t.boolean :public

      t.timestamps
    end
    add_index :contacts, :user_id
    add_index :contacts, :contacttype_id
  end
end
