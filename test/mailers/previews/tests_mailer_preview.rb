# Preview all emails at http://localhost:3000/rails/mailers/tests_mailer
class TestsMailerPreview < ActionMailer::Preview
  def completed_test
    TestsMailer.completed_test(TestsPassage.take)
  end
end