class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :users, through: :answers

  validates :user, presence: true
  validates :title, length: { minimum: 40, maximum: 255 }
  validates :description, length: { minimum: 150, maximum: 10000 }

end
