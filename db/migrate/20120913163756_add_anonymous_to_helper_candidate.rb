class AddAnonymousToHelperCandidate < ActiveRecord::Migration
  def change
    add_column :helper_candidates, :anonymous, :boolean
  end
end
