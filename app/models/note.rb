class Note < ActiveRecord::Base
	belongs_to :clinician
	belongs_to :patient

	validates :patient_id, presence: true
	validates :clinician_id, presence: true
	validates :care_note, presence: true
end
