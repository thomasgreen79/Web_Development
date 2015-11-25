class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode 
end
