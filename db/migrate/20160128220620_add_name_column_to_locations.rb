class AddNameColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :name, :string, null: false
  end
end
