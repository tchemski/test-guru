class TestsPassagesController < ApplicationController
  before_action :user_auth
  before_action :find_tests_passage, only: %i[show result update]

  def show; end

  def result; end

  def update
    @tests_passage.accept!(answer_ids)

    if @tests_passage.complited?
      redirect_to result_tests_passage_path(@tests_passage)
    else
      render :show
    end
  end

  private

  def find_tests_passage
    @tests_passage = TestsPassage.find(params[:tests_passage_id])
  end

  def answer_ids
    return params[:answer_ids].map(&:to_i) if params[:answer_ids]

    []
  end
end
