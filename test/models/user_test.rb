require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "updated timestamp should be set to the current time" do
    freeze_time
    user = users(:one)
    user.update(name: 'test')
    assert_equal Time.current, user.updated_at
  end
end