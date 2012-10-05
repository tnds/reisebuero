class AddTextToContacttype < ActiveRecord::Migration
  def change
    add_column :contacttypes, :text, :boolean
    
    change_table :contacts do |t|
      t.change :address, :text
    end
  end
end
