class TestsController < ApplicationController
  before_action :user_auth, only: %i[index create new edit update destroy]
  before_action :find_test, only: %i[show]
  before_action :find_own_test, only: %i[edit update destroy]
  before_action :find_questions, only: %i[edit show]
  def index
    @tests = Test.with_questions_count
  end

  def create
    @test = @user.own_tests.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to :tests
  end

  def edit; end

  def new
    @test = @user.tests.new
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_own_test
    @test = @user.own_tests.find(params[:test_id])
  end

  def find_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
