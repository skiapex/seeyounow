class CommentAssociation < ActiveRecord::Base
	belongs_to :clinician
  belongs_to :comment
end
