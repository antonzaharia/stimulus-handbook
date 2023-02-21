require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase

  test "connects with devise" do
    user = users(:one)
    connect env: { 'warden' => FakeEnd.new(user) }
    assert_equal connection.current_user, user
  end

  test "unauthorized without devise" do
    assert_raises ActionCable::Connection::Authorization::UnauthorizedError do
      connect env: { 'warden' => FakeEnd.new(nil) }
    end
  end

  private

  class FakeEnd
    attr_reader :user
    def initialize(user)
      @user = user
    end
  end
end
