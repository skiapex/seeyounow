class User < ActiveRecord::Base
  has_secure_password

  has_one :patient, :dependent => :destroy
  has_one :clinician, :dependent => :destroy
  accepts_nested_attributes_for :patient,  :allow_destroy => true 
  accepts_nested_attributes_for :clinician,  :allow_destroy => true
  has_many :feedbacks
  
  validates :password,
  	:length => { :minimum => 6 }, :if => :password_digest_changed?
  validates_presence_of     :password, on: :create

  before_validation(on: :update) do
    # only want confirmation validation to run if user enters password
    self.password_confirmation = nil unless self.password.present?
  end

  # validates_uniqueness_of :email

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
