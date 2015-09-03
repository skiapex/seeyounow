class Patient < ActiveRecord::Base
  belongs_to :care_group
	has_many :esas_assessments, dependent: :destroy
  has_many :prfs_assessments, dependent: :destroy
	belongs_to :gender
	has_many :clinicians ,:through=> :care_group_assignments
  has_many :care_group_assignments
	belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :care_givers, dependent: :destroy
  accepts_nested_attributes_for :user,  :allow_destroy => true

  def full_name
    first_name + " " + last_name
  end

  # def set_user_id_from_user
  #   patient.user_id = user.id
  # end

  # before_validation :set_user_id_from_user

  	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :diagnosis, presence: true
  	validates :gender_id, presence: true
  	validates :birth_date, presence: true
  	validates :address, presence: true
  	validates :phone_number, presence: true
  	validates :goals_of_care, presence: true
end
