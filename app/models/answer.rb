class Answer < ApplicationRecord
  MAX_NUMBER_ANSWERS = 4
  belongs_to :question

  # Question.take.answers.with_true_correctness
  scope :with_true_correctness, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_number_answers, on: :create

  private

  def validate_max_number_answers
    return false if question.answers.count < MAX_NUMBER_ANSWERS

    errors.add(:question_id, "too much anwers, #{MAX_NUMBER_ANSWERS} maximum")
  end
end
