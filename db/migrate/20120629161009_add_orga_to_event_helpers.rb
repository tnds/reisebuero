class AddOrgaToEventHelpers < ActiveRecord::Migration
  def change
    add_column :event_helpers, :orga, :boolean, :default => false
  end
end
