require "test_helper"

class UpdateUserJobTest < ActiveJob::TestCase
  setup do
    @user = users(:one)
  end

  test "update score" do
    UpdateUserJob.perform_now(@user.id, 9)
    assert_equal 9, @user.reload.score
  end
end
