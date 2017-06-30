class User < ApplicationRecord
  belongs_to :clinician, optional: true

  has_many :scores
  has_many :alternatives

  #bcrypt
  has_secure_password

  validates :email, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }, on: :create
  validates :patient_number, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number, :sex, :birth_date, :education, presence: true
end
