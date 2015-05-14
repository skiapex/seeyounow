class Inputter < ActiveRecord::Base
	has_many :esas_assessments
	has_many :prfs_assessments
end
