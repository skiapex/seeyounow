class Patient < ActiveRecord::Base
	has_many :esas_assessments, dependent: :destroy
	belongs_to :gender
	belongs_to :clinician
	belongs_to :user

  	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :diagnosis, presence: true
  	validates :gender_id, presence: true
  	validates :age, presence: true, numericality: true
  	validates :address, presence: true
  	validates :phone_number, presence: true
  	validates :caregiver_name, presence: true
  	validates :other_symptom, presence: true
  	validates :goals_of_care, presence: true
end
