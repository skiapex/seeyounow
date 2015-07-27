class Circlization < ActiveRecord::Base
	belongs_to :clinician
	belings_to :patient
end
