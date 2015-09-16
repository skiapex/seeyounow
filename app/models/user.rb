class User < ActiveRecord::Base
  has_secure_password

  has_one :patient, :dependent => :destroy
  has_one :clinician, :dependent => :destroy
  accepts_nested_attributes_for :patient,  :allow_destroy => true 
  accepts_nested_attributes_for :clinician,  :allow_destroy => true
  has_many :feedbacks
  
  validates :password,
  	:length => { :minimum => 6 }, :if => :password_digest_changed?
  validates :password_confirmation, 
    :presence=>true, :if => :password_digest_changed?
  validates_confirmation_of :password
  validates_presence_of     :password, on: :create

  before_validation(on: :update) do
    # only want confirmation validation to run if user enters password
    self.password_confirmation = nil unless self.password.present?
  end

  validates_uniqueness_of :email
end
