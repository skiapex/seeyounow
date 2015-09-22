class Clinician < ActiveRecord::Base
  #acts_as_messageable
	belongs_to :care_group
  has_many :comments
  has_many :notes
	belongs_to :gender
	has_many :patients , through: :care_group_assignments
  has_many :care_group_assignments
  has_many :esas_assessments, :through => :patients
  has_many :prfs_assessments, :through => :patients
	belongs_to :occupation
  belongs_to :speciality
	belongs_to :user
  accepts_nested_attributes_for :user,  :allow_destroy => true

  def full_name
    if occupation.pronym.nil?
      if occupation.acronym.nil?
        first_name + " " + last_name
      else
        first_name + " " + last_name + ", " + occupation.acronym
      end
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
end
