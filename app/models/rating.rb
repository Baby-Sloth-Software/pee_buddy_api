class Rating < ActiveRecord::Base
  belongs_to :category
  belongs_to :location
  belongs_to :user

  validates_presence_of :location_id, :rating, :category_id

  enum rating: [:happy, :sad]

#  validates_uniqueness_of :location_id, scope: [ :user_id, :category_id ]
end
