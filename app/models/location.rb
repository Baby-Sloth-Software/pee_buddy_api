class Location < ActiveRecord::Base
  has_many :ratings

  validates_presence_of :lat, :lng, :place_id
  validates_uniqueness_of :place_id

end
