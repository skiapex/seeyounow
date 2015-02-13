class Gender < ActiveRecord::Base
	has_many :clinicians
	has_many :patients
end
