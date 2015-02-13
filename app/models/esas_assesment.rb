class EsasAssesment < ActiveRecord::Base
	belongs_to :other_symptom
	belongs_to :clinician
	belongs_to :patient
end
