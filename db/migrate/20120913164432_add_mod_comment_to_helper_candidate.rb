class AddModCommentToHelperCandidate < ActiveRecord::Migration
  def change
    add_column :helper_candidates, :mod_comment, :text
  end
end
