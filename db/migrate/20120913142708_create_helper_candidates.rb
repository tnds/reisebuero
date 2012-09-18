class CreateHelperCandidates < ActiveRecord::Migration
  def change
    create_table :helper_candidates do |t|
      t.references :user
      t.date :start_at
      t.date :end_at
      t.string :comment

      t.timestamps
    end
    add_index :helper_candidates, :user_id
  end
end
