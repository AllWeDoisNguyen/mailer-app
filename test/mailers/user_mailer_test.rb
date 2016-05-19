require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "follow_up" do
    target_email = "me@example.com"
    mail = UserMailer.follow_up(target_email).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    # assert_equal [target_email], email.to

    # assert_equal "Follow up", mail.subject
    assert_equal [target_email], mail.to
    assert_equal ["no-reply@example.com"], mail.from
    assert_equal "How are things going?", mail.subject
    # assert_match "Hi", mail.body.encoded
    assert_match "Twitter and Facebook", mail.body.encoded
  end

end
