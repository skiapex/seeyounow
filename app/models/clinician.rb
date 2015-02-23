class Clinician < ActiveRecord::Base
	belongs_to :care_group
	has_many :esas_assesments
	belongs_to :gender
	has_many :patients, through: :esas_assesments
	belongs_to :occupation

	validates :first_name, presence: true
  validates :occupation_id, presence: true, numericality: true
end
