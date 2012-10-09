class AddLocationToHelperCandidate < ActiveRecord::Migration
  def change
    add_column :helper_candidates, :location, :text
  end
end
