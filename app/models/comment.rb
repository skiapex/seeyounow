class Comment < ActiveRecord::Base
  has_many :clinicians, through: :comment_associations
  has_many :comment_associations, dependent: :destroy
	belongs_to :patient

	validates :patient_id, presence: true
	validates :from, presence: true
	validates :general_comment, presence: true
end
