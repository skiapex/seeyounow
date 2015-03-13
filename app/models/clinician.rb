class Clinician < ActiveRecord::Base
  #acts_as_messageable
	belongs_to :care_group
	has_many :esas_assessments
  has_many :comments
	belongs_to :gender
	has_many :patients #, through: :esas_assessments
	belongs_to :occupation
	belongs_to :user

  	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :occupation_id, presence: true
  	validates :gender_id, presence: true
  	validates :office_number, presence: true
  	validates :mobile_number, presence: true
  	validates :emergency_message, presence: true
end
