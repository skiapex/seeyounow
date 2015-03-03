class User < ActiveRecord::Base
  has_secure_password
  #acts_as_messageable
  has_one :patient
  has_one :clinician
  
  validates :email, presence: true
end
