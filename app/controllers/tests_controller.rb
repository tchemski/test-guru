class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.with_questions_count
  end

  def start
    current_user.tests << @test
    redirect_to current_user.tests_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
