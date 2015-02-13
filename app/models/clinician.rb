class Clinician < ActiveRecord::Base
	belongs_to :care_group
	has_many :esas_assesments
	belongs_to :gender
	has_many :patients, through: :esas_assesments
end
