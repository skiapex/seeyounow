class Speciality < ActiveRecord::Base
	belongs_to :occupation
	has_many :clinicians
end
