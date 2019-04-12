module Admin::QuestionsHelper
  HEADER_TEXT = {
    new: 'Create New %s Question',
    edit: 'Edit %s Question'
  }.freeze

  # Create New <Test Title> Question, а в форме редактирования Edit <Test Title> Question
  def header_text(question)
    header = question.new_record? ? HEADER_TEXT[:new] : HEADER_TEXT[:edit]
    format(header, question.test.title)
  end
end
