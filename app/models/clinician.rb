class Clinician < ApplicationRecord
  has_many :users

  # bcrypt
  has_secure_password

  validates :email, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :first_name, :last_name, :password_digest, :practice, presence: true
end
