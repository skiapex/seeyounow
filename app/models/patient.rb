class Patient < ActiveRecord::Base
	has_many :esas_assesments, dependent: :destroy
	belongs_to :gender
	belongs_to :clinician
	belongs_to :user

	validates :first_name, presence: true
  	validates :clinician_id, presence: true, numericality: true
end
