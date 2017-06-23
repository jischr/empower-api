class User < ApplicationRecord
  belongs_to :clinician

  has_many :scores
  has_many :alternatives

  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :first_name, :last_name, :password_digest, :patient_number, :phone_number, presence: true
end
