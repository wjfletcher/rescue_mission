class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :description, length: { minimum: 50, maximum: 10000 }
end
