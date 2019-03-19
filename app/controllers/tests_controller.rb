class TestsController < ApplicationController
  before_action :user_auth, only: %i[create new edit destroy]
  before_action :find_test, only: %i[show edit destroy start]
  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def beginner
  end

  def start
  end

  def create
    test = Test.create(params.require(:test).permit(:title, :level))
    render plain: test.inspect
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def rescue_with_test_not_found
    # TODO:
  end
end
