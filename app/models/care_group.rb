class CareGroup < ActiveRecord::Base
	has_many :clinicians

	validates :name, presence: true
end
