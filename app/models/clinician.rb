class Clinician < ActiveRecord::Base
  #acts_as_messageable
	belongs_to :care_group
	has_many :esas_assessments
  has_many :prfs_assessments
  has_many :comments
	belongs_to :gender
	has_many :patients #, through: :esas_assessments
	belongs_to :occupation
  belongs_to :speciality
	belongs_to :user
  accepts_nested_attributes_for :user,  :allow_destroy => true

  def full_name
    if occupation.pronym.nil?
      first_name + " " + last_name + " " + occupation.acronym
    else
      occupation.pronym + " " + first_name + " " + last_name
    end
  end

  	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :occupation_id, presence: true
  	validates :gender_id, presence: true
  	validates :office_number, presence: true
  	validates :mobile_number, presence: true
  	validates :emergency_message, presence: true
end
