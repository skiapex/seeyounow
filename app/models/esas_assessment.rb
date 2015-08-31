class EsasAssessment < ActiveRecord::Base
	belongs_to :other_symptom
	belongs_to :clinician
	belongs_to :patient
  belongs_to :care_giver

  validates :pain, presence: true, numericality: true
  validates :tiredness, presence: true, numericality: true
  validates :drowsiness, presence: true, numericality: true
  validates :nausea, presence: true, numericality: true
  validates :lack_of_appetite, presence: true, numericality: true
  validates :shortness_of_breath, presence: true, numericality: true
  validates :depression, presence: true, numericality: true
  validates :anxiety, presence: true, numericality: true
  validates :wellbeing, presence: true, numericality: true
  validates :other_symptom_id, presence: true
  validates :other_symptom_score, presence: true, numericality: true
end
