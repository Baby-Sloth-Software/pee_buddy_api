class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
#      t.references :rateable, polymorphic: true, index: true
      t.references :location, index: true, null: false
      t.references :user, index: true
      t.references :category, index: true, null: false
      t.integer :rating, null: false

      t.timestamps null: false
    end
  end
end
