class Answer < ApplicationRecord
  belongs_to :question

  # Question.take.answers.with_true_correctness
  scope :with_true_correctness, -> { where(correct: true) }

  validates :body, presence: true
end
