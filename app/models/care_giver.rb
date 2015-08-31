class CareGiver < ActiveRecord::Base
	belongs_to :patient
	belongs_to :inputter
	has_many :esas_assessments
    has_many :prfs_assessments

	def full_name
    if last_name.nil?
      first_name
    else
      first_name + " " + last_name
    end
  end

	validates :patient_id, presence: true
	validates :inputter_id, presence: true
	validates :first_name, presence: true
end
