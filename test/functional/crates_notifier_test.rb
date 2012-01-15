require 'test_helper'

class CratesNotifierTest < ActionMailer::TestCase
  test "crate_received" do
    mail = CratesNotifier.crate_received
    assert_equal "Crate received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "crate_paid" do
    mail = CratesNotifier.crate_paid
    assert_equal "Crate paid", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
