require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  # Freeze the time
  test "updated timestamp should be set to the current time" do
    freeze_time
    @user.update(name: 'test')
    assert_equal Time.current, @user.updated_at
  end

  test "has 7 day free trial" do
    assert @user.on_trial?
  end

  # Travel in the future
  test "7 days trial finished" do
    travel 8.days do
      assert_not @user.on_trial?
    end
  end
end