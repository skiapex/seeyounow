class User < ActiveRecord::Base
  has_secure_password
  has_one :patient
  has_one :clinician
  
  validates :email, presence: true
end
