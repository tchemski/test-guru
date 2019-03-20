class TestsController < ApplicationController
  before_action :user_auth, only: %i[create new]
  before_action :find_test, only: %i[show]
  def index
    @tests = Test.all
  end

  def create
    test = Test.create(params.require(test_params))
    render plain: test.inspect
  end

  def new
    @test = Test.new
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
