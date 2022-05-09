require "test_helper"

class CommentsMailerTest < ActionMailer::TestCase
  test "submitted" do
    mail = CommentsMailer.submitted comments(:one)
    assert_equal "New comment :D", mail.subject
    assert_equal ["me@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
