class Feedback < ActiveRecord::Base
	belongs_to :user

	validates :feedback_comment, presence: true
end
