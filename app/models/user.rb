class User < ActiveRecord::Base
  has_secure_password
  has_one :patient, :dependent => :destroy
  has_one :clinician, :dependent => :destroy
  accepts_nested_attributes_for :patient,  :allow_destroy => true 
  accepts_nested_attributes_for :clinician,  :allow_destroy => true
  has_many :feedbacks
  
  validates :email, presence: true
  validates_uniqueness_of :email
end
