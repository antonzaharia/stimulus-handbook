require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet = tweets(:one)
    sign_in users(:one)
  end

  test "redirected if not logged in" do
    sign_out :user
    get tweets_url
    assert_response :redirect
  end

  test "visit the tweets idnex" do
    get tweets_url
    assert_response :success
  end

  test "should show tweet" do
    get tweet_url(@tweet)
    assert_response :success
  end

  test "should get edit" do
    get edit_tweet_url(@tweet)
    assert_response :success
  end

end
