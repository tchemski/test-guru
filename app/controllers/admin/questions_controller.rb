class Admin::QuestionsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_question_and_set_test, only: %i[show destroy edit update]
  before_action :find_test, only: %i[create new]
  before_action :find_answers, only: %i[show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render plain: 'Question Not Create', status: :bad_request
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render plain: 'Question Not Update', status: :bad_request
    end
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to @test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question_and_set_test
    @question = Question.find(params[:question_id])
    @test = @question.test
  end

  def rescue_with_question_not_found
    render plain: 'Question Not Found', status: :not_found
  end

  def find_answers
    @answers = @question.answers
  end
end
