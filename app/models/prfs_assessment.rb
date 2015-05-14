class PrfsAssessment < ActiveRecord::Base
  belongs_to :clinician
  belongs_to :patient
  belongs_to :inputter
end
