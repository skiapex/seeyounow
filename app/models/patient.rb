class Patient < ActiveRecord::Base
	has_many :esas_assesments, dependent: :destroy
	belongs_to :gender
	belongs_to :clinician

	validates :first_name, presence: true
end
