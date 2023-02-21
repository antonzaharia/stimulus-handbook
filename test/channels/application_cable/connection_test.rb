require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  # test "connects with cookies" do
  #   cookies.signed[:user_id] = 42
  #
  #   connect
  #
  #   assert_equal connection.user_id, "42"
  # end

  test "connects with devise" do
    user = users(:one)
    connect env: { 'warden' => FakeEnd.new(user) }
    assert_equal connection.current_user, user
  end

  private

  class FakeEnd
    attr_reader :user
    def initialize(user)
      @user = user
    end
  end
end
