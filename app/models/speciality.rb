class Speciality < ActiveRecord::Base
	belongs_to :occupation
	has_many :clinicians

  	validates :name, presence: true
end
