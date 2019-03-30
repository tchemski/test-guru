class TestsPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',
                                foreign_key: 'current_question_id',
                                optional: true

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    true_ids = current_question.answers.with_true_correctness.ids
    self.correct_questions += 1 if true_ids - answer_ids == answer_ids - true_ids

    self.current_question = next_question
    save!
  end

  def complited?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question).first
  end
end
