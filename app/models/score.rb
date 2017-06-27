class Score < ApplicationRecord
  belongs_to :user
  belongs_to :measure

  validates :score_value, :user_id, :measure_id, presence: true
end
