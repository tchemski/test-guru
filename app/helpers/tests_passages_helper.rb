module TestsPassagesHelper
  def progress(tests_passage)
    "#{tests_passage.num[:current_question]} from #{tests_passage.num[:questions]}"
  end

  def percentage(tests_passage)
    number_to_percentage(tests_passage.percentage, precision: 1)
  end
end
