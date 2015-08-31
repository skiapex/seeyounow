class PrfsAssessment < ActiveRecord::Base
  belongs_to :clinician
  belongs_to :patient
  belongs_to :care_giver
end
