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

  def complited?
    current_question.nil?
  end

  def num
    init_num unless @num
    @num
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_validation_set_next_question
    self.current_question =
      test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def init_num
    @num = {}
    ordered = test.questions.order(:id)
    @num[:questions] = ordered.count

    if !complited?
      complited = ordered.where('id < ?', current_question.id)
      @num[:complited_questions] = complited.count
      @num[:current_question] = @num[:complited_questions] + 1
    else
      @num[:complited_questions] = @num[:questions]
    end
  end
end
