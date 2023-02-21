require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase

  test "connects with devise" do
    user = users(:one)
    connect_with(user)
    assert_equal connection.current_user, user
  end

  test "unauthorized without devise" do
    assert_raises ActionCable::Connection::Authorization::UnauthorizedError do
      connect_with(nil)
    end
  end

  private

  def connect_with(user)
    connect env: { 'warden' => FakeEnd.new(user) }
  end

  class FakeEnd
    attr_reader :user
    def initialize(user)
      @user = user
    end
  end
end
