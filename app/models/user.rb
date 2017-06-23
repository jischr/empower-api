class User < ApplicationRecord
  belongs_to :clinician, optional: true

  has_many :scores
  has_many :alternatives

  #bcrypt
  has_secure_password

  validates :email, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :first_name, :last_name, :password_digest, :patient_number, :phone_number, presence: true
end
