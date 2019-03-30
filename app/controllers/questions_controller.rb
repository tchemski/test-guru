class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[create new]
  before_action :user_auth, only: %i[create new destroy]
  before_action :find_answers, only: %i[show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    @question = @test.questions.new(create_params)
    if @question.save
      redirect_to question_path(@question)
    else
      render plain: 'Question Not Create', status: :bad_request
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

  def create_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
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
