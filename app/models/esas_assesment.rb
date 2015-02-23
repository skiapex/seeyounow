class EsasAssesment < ActiveRecord::Base
	belongs_to :other_symptom
	belongs_to :clinician
	belongs_to :patient

  validates :inputter_name, presence: true
  validates :pain, presence: true, numericality: true
end
