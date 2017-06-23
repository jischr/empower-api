class Measure < ApplicationRecord
  has_many :questions
  has_many :scores
end
