class Comment < ActiveRecord::Base
	belongs_to :clinician
	belongs_to :patient

	validates :patient_id, presence: true
  	validates :clinician_id, presence: true
  	validates :from, presence: true
  	validates :general_comment, presence: true
end
