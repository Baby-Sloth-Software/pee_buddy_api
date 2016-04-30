class ChangePlaceIdColumnToString < ActiveRecord::Migration
  def change
    change_column_null :locations, :place_id, false
    change_column_null :locations, :lat, false
    change_column_null :locations, :lng, false

    change_column :locations, :place_id, :string
  end
end
