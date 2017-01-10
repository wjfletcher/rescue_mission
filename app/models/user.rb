class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :questions, through: :answers

  validates :username, presence: true
end
