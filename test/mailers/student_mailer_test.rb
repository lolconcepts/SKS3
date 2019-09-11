require 'test_helper'

class StudentMailerTest < ActionMailer::TestCase
  test "new_rank" do
    mail = StudentMailer.new_rank
    assert_equal "New rank", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "we_miss_you" do
    mail = StudentMailer.we_miss_you
    assert_equal "We miss you", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "happy_birthday" do
    mail = StudentMailer.happy_birthday
    assert_equal "Happy birthday", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
