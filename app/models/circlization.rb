class Circlization < ActiveRecord::Base
	belongs_to :clinician
	belongs_to :patient
end
