class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show update destroy edit]
  before_action :find_test
  before_action :user_auth, only: %i[create new edit destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def create
    @question = Question.create!(create_params)
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @question.destroy
  end

  private

  def create_params
    params.require(:question).permit(:body)
          .merge!(params.permit(:test_id))
  end

  def find_question
    @question = Question.find(params[:question_id])
    params[:test_id] = @question.test_id
  end

  def rescue_with_question_not_found
    render plain: "Question Not Found", status: :not_found
  end
end
