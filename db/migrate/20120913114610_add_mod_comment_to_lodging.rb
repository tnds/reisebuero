class AddModCommentToLodging < ActiveRecord::Migration
  def change
    add_column :lodgings, :mod_comment, :text
  end
end
