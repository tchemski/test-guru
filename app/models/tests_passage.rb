class TestsPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',
                                foreign_key: 'current_question_id',
                                optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    true_ids = current_question.answers.with_true_correctness.ids
    self.correct_questions += 1 if true_ids - answer_ids == answer_ids - true_ids

    save!
  end

  def completed?
    current_question.nil?
  end

  def num
    @num ||= init_num
  end

  def percentage
    (correct_questions.to_f / num[:questions]) * 100
  end

  def passed?
    percentage >= Test::ACCEPTABLE_PERCENTAGE
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_validation_set_next_question
    self.current_question =
      test.ordered_questions.where('id > ?', current_question.id).first
  end

  def init_num
    @num = {}
    @num[:questions] = test.questions.count

    if !completed?
      @num[:completed_questions] = test.ordered_questions.where('id < ?', current_question.id).count
      @num[:current_question] = @num[:completed_questions] + 1
    else
      @num[:completed_questions] = @num[:questions]
    end

    @num
  end
end
