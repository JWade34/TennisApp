class Match < ApplicationRecord
  belongs_to :user

  validates :opponent_name, presence: true
  validates :date, presence: true
  validates :result, presence: true
end
