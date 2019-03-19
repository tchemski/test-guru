class TestsController < ApplicationController
  before_action :user_auth, only: %i[create new]

  def index
    @tests = Test.all
  end

  def create
    test = Test.create(params.require(create_params))
    render plain: test.inspect
  end

  def new
    @test = Test.new
  end

  private

  def create_params
    params.require(:test).permit(:title, :level)
  end
end
