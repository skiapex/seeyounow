class CareGroup < ActiveRecord::Base
	has_many :clinicians
	has_many :patients

	validates :name, presence: true
end
