require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "follow_up" do
    target_email = "me@example.com"
    email = UserMailer.follow_up(target_email).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    # assert_equal [target_email], email.to

    # assert_equal "Follow up", mail.subject
    assert_equal [target_email], email.to
    assert_equal ["no-reply@example.com"], email.from
    assert_equal "How are things going?", email.subject
    # assert_match "Hi", mail.body.encoded
    assert_match "Twitter and Facebook", email.body.encoded
  end

end
