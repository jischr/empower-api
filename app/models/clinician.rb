class Clinician < ApplicationRecord
  has_many :users
  validates :email, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :first_name, :last_name, :password_digest, :practice, presence: true
end
