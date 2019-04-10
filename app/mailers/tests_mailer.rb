class TestsMailer < ApplicationMailer
  def completed_test(tests_passage)
    @user = tests_passage.user
    @test = tests_passage.test

    mail to: @user.email, subject: "You just completed the #{@test.title} TestGuru!"
  end
end
