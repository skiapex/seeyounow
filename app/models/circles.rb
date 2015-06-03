class Circles < ActiveRecord::Base
	belongs_to :clinician
	belongs_to :patient
end
