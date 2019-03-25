module QuestionsHelper
  BEGINING_TEXT = {
    new: 'Create New',
    edit: 'Edit'
  }.freeze

  ENDING_TEXT = 'Question'.freeze

  # Create New <Test Title> Question, а в форме редактирования Edit <Test Title> Question
  def header_text(action_name, test)
    "#{BEGINING_TEXT[action_name.to_sym]} #{test.title} #{ENDING_TEXT}"
  end
end
