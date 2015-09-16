class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :patient, :dependent => :destroy
  has_one :clinician, :dependent => :destroy
  accepts_nested_attributes_for :patient,  :allow_destroy => true 
  accepts_nested_attributes_for :clinician,  :allow_destroy => true
  has_many :feedbacks
  
end
