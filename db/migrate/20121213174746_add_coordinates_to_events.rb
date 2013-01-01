class AddCoordinatesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end
end
