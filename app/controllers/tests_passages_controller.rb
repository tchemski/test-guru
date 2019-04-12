class TestsPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_tests_passage, only: %i[show result update]

  def show; end

  def result; end

  def update
    @tests_passage.accept!(answer_ids)

    if @tests_passage.completed?
      TestsMailer.completed_test(@tests_passage).deliver_now
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
    params[:answer_ids] ? params[:answer_ids].map(&:to_i) : []
  end
end
