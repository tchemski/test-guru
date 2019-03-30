module TestsPassagesHelper

  def progress(tests_passage)
    "#{tests_passage.num[:current_question]} from #{tests_passage.num[:questions]}"
  end

  def percentage(tests_passage)
    (tests_passage.correct_questions.to_f / tests_passage.num[:questions]) * 100
  end

  def passed?(tests_passage)
    percentage(tests_passage) >= Test::ACCEPTABLE_PERCENTAGE
  end
end
