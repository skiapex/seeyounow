class Occupation < ActiveRecord::Base
	has_many :clinicians
	has_many :specialities

  	validates :name, presence: true
end
