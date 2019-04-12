class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show start edit update destroy]
  before_action :find_questions, only: %i[edit show]
  def index
    @tests = Test.with_questions_count
  end

  def create
    @test = current_user.own_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def edit; end

  def new
    @test = current_user.tests.new
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :new
    end
  end

  def show; end

  def start
    current_user.tests << @test
    redirect_to current_user.tests_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_own_test
    @test = current_user.own_tests.find(params[:test_id])
  end

  def find_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
